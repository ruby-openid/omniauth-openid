require "omniauth"
require "rack/openid"
require "openid/store/memory"

module OmniAuth
  module Strategies
    # OmniAuth strategy for connecting via OpenID. This allows for connection
    # to a wide variety of sites, some of which are listed [on the OpenID website](http://openid.net/get-an-openid/).
    class OpenID
      include OmniAuth::Strategy

      AX = {
        email: "http://axschema.org/contact/email",
        name: "http://axschema.org/namePerson",
        nickname: "http://axschema.org/namePerson/friendly",
        first_name: "http://axschema.org/namePerson/first",
        last_name: "http://axschema.org/namePerson/last",
        city: "http://axschema.org/contact/city/home",
        state: "http://axschema.org/contact/state/home",
        website: "http://axschema.org/contact/web/default",
        image: "http://axschema.org/media/image/aspect11",
      }

      option :name, :open_id
      option :required, [AX[:email], AX[:name], AX[:first_name], AX[:last_name], "email", "fullname"]
      option :optional, [AX[:nickname], AX[:city], AX[:state], AX[:website], AX[:image], "postcode", "nickname"]
      option :immediate, false
      option :trust_root, proc { |root_uri| nil }
      option :store, ::OpenID::Store::Memory.new
      option :identifier, nil
      option :identifier_param, "openid_url"
      option :trust_root, nil

      def dummy_app
        lambda { |env|
          req = Rack::Request.new(env)
          root_uri = "#{req.scheme}://#{req.host_with_port}/"
          trust_root = if options.trust_root
            if options.trust_root.respond_to?(:call)
              options.trust_root.call(root_uri)
            else
              options.trust_root
            end
          else
            %r{^(https?://[^/]+)}.match(callback_url) { |m| m[1] }
          end

          [
            401,
            {
              "WWW-Authenticate" => Rack::OpenID.build_header(
                identifier: identifier,
                return_to: callback_url,
                trust_root: trust_root,
                required: options.required,
                optional: options.optional,
                method: "post",
                immediate: options.immediate,
              ),
            },
            [],
          ]
        }
      end

      def identifier
        i = options.identifier || request.params[options.identifier_param.to_s]
        i = nil if i == ""
        i
      end

      def request_phase
        identifier ? start : get_identifier
      end

      def start
        openid = Rack::OpenID.new(dummy_app, options[:store])
        response = openid.call(env)
        case env["rack.openid.response"]
        when Rack::OpenID::MissingResponse, Rack::OpenID::TimeoutResponse
          fail!(:connection_failed)
        else
          response
        end
      end

      def get_identifier
        f = OmniAuth::Form.new(title: "OpenID Authentication")
        f.label_field("OpenID Identifier", options.identifier_param)
        f.input_field("url", options.identifier_param)
        f.to_response
      end

      uid { openid_response.display_identifier }

      info do
        sreg_user_info.merge(ax_user_info)
      end

      extra do
        {"response" => openid_response}
      end

      def callback_phase
        return fail!(:invalid_credentials) unless openid_response && openid_response.status == :success
        super
      end

      def openid_response
        unless @openid_response
          openid = Rack::OpenID.new(lambda { |env| [200, {}, []] }, options[:store])
          openid.call(env)
          @openid_response = env.delete("rack.openid.response")
        end
        @openid_response
      end

      def sreg_user_info
        sreg = ::OpenID::SReg::Response.from_success_response(openid_response)
        return {} unless sreg
        {
          "email" => sreg["email"],
          "name" => sreg["fullname"],
          "location" => sreg["postcode"],
          "nickname" => sreg["nickname"],
        }.reject { |k, v| v.nil? || v == "" }
      end

      def ax_user_info
        ax = ::OpenID::AX::FetchResponse.from_success_response(openid_response)
        return {} unless ax
        {
          "email" => ax.get_single(AX[:email]),
          "first_name" => ax.get_single(AX[:first_name]),
          "last_name" => ax.get_single(AX[:last_name]),
          "name" => (ax.get_single(AX[:name]) || [ax.get_single(AX[:first_name]), ax.get_single(AX[:last_name])].join(" ")).strip,
          "location" => ("#{ax.get_single(AX[:city])}, #{ax.get_single(AX[:state])}" if Array(ax.get_single(AX[:city])).any? && Array(ax.get_single(AX[:state])).any?),
          "nickname" => ax.get_single(AX[:nickname]),
          "urls" => ({"Website" => Array(ax.get_single(AX[:website])).first} if Array(ax.get_single(AX[:website])).any?),
        }.each_with_object({}) { |(k, v), h|
          h[k] = Array(v).first
        }.reject { |k, v| v.nil? || v == "" }
      end
    end
  end
end

OmniAuth.config.add_camelization("openid", "OpenID")
OmniAuth.config.add_camelization("open_id", "OpenID")
