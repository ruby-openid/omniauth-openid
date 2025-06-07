RSpec.describe OmniAuth::Strategies::OpenID, type: :strategy do
  def app
    strat = OmniAuth::Strategies::OpenID
    Rack::Builder.new {
      use Rack::Session::Cookie, secret: SecureRandom.hex(64)
      use strat
      run lambda { |env| [404, {"Content-Type" => "text/plain"}, [nil || env.key?("omniauth.auth").to_s]] }
    }.to_app
  end

  def expired_query_string
    "openid=consumer&janrain_nonce=2011-07-21T20%3A14%3A56ZJ8LP3T&openid.assoc_handle=%7BHMAC-SHA1%7D%7B4e284c39%7D%7B9nvQeg%3D%3D%7D&openid.claimed_id=http%3A%2F%2Flocalhost%3A1123%2Fjohn.doe%3Fopenid.success%3Dtrue&openid.identity=http%3A%2F%2Flocalhost%3A1123%2Fjohn.doe%3Fopenid.success%3Dtrue&openid.mode=id_res&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.op_endpoint=http%3A%2F%2Flocalhost%3A1123%2Fserver%2F%3Fopenid.success%3Dtrue&openid.response_nonce=2011-07-21T20%3A14%3A56Zf9gC8S&openid.return_to=http%3A%2F%2Flocalhost%3A8888%2FDevelopment%2FWordpress%2Fwp_openid%2F%3Fopenid%3Dconsumer%26janrain_nonce%3D2011-07-21T20%253A14%253A56ZJ8LP3T&openid.sig=GufV13SUJt8VgmSZ92jGZCFBEvQ%3D&openid.signed=assoc_handle%2Cclaimed_id%2Cidentity%2Cmode%2Cns%2Cop_endpoint%2Cresponse_nonce%2Creturn_to%2Csigned"
  end

  describe "/auth/open_id without an identifier URL" do
    before do
      post "/auth/open_id"
    end

    it "responds with OK" do
      expect(last_response).to be_ok
    end

    it "responds with HTML" do
      expect(last_response.content_type).to eq "text/html"
    end

    it "renders an identifier URL input" do
      expect(last_response.body).to match %r{<input[^>]*openid_url}
    end
  end

  # describe '/auth/open_id with an identifier URL' do
  #   context 'successful' do
  #     before do
  #       @identifier_url = 'http://me.example.org'
  #       # TODO: change this mock to actually return some sort of OpenID response
  #       stub_request(:get, @identifier_url)
  #       get '/auth/open_id?openid_url=' + @identifier_url
  #     end
  #
  #     it 'should redirect to the OpenID identity URL' do
  #       last_response.should be_redirect
  #       last_response.headers['Location'].should =~ %r{^#{@identifier_url}.*}
  #     end
  #
  #     it 'should tell the OpenID server to return to the callback URL' do
  #       return_to = CGI.escape(last_request.url + '/callback')
  #       last_response.headers['Location'].should =~ %r{[\?&]openid.return_to=#{return_to}}
  #     end
  #   end
  # end

  describe "followed by /auth/open_id/callback" do
    context "successful" do
      # before do
      #   @identifier_url = 'http://me.example.org'
      #   # TODO: change this mock to actually return some sort of OpenID response
      #   stub_request(:get, @identifier_url)
      #   get '/auth/open_id/callback'
      # end

      it "should set provider to open_id"
      it "should create auth_hash based on sreg"
      it "should create auth_hash based on ax"

      # it 'should call through to the master app' do
      #   last_response.body.should == 'true'
      # end
    end

    context "unsuccessful" do
      describe "returning with expired credentials" do
        it "redirects to invalid credentials" do
          pending
          expect(last_response).to be_redirect
          expect(last_response).to match %r{invalid_credentials}
        end
      end
    end
  end
end
