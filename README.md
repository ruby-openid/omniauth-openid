# OmniAuth::OpenID 

[![Liberapay Goal Progress][⛳liberapay-img]][⛳liberapay] [![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor] [![Buy me a coffee][🖇buyme-small-img]][🖇buyme] [![Donate on Polar][🖇polar-img]][🖇polar] [![Donate to my FLOSS or refugee efforts at ko-fi.com][🖇kofi-img]][🖇kofi] [![Donate to my FLOSS or refugee efforts using Patreon][🖇patreon-img]][🖇patreon]

---
[⛳liberapay-img]: https://img.shields.io/liberapay/goal/pboling.svg?logo=liberapay
[⛳liberapay]: https://liberapay.com/pboling/donate
[🖇sponsor-img]: https://img.shields.io/badge/Sponsor_Me!-pboling.svg?style=social&logo=github
[🖇sponsor]: https://github.com/sponsors/pboling
[🖇polar-img]: https://img.shields.io/badge/polar-donate-yellow.svg
[🖇polar]: https://polar.sh/pboling
[🖇kofi-img]: https://img.shields.io/badge/a_more_different_coffee-✓-yellow.svg
[🖇kofi]: https://ko-fi.com/O5O86SNP4
[🖇patreon-img]: https://img.shields.io/badge/patreon-donate-yellow.svg
[🖇patreon]: https://patreon.com/galtzo
[🖇buyme-small-img]: https://img.shields.io/badge/buy_me_a_coffee-✓-yellow.svg?style=flat

Provides strategies for authenticating to providers using the OpenID v2 standard, which is deprecated, and very old. It is *not* for the modern OpenID Connect standard.  If you want OpenID Connect then you want: [omniauth/omniauth_openid_connect](https://github.com/omniauth/omniauth_openid_connect)

## Installation

    gem install omniauth-openid

## Stand-Alone Example

Use the strategy as a middleware in your application:

    require 'omniauth-openid'
    require 'openid/store/filesystem'

    use Rack::Session::Cookie
    use OmniAuth::Strategies::OpenID, :store => OpenID::Store::Filesystem.new('/tmp')

Then simply direct users to `/auth/open_id` to prompt them for their OpenID identifier. You may also pre-set the identifier by passing an `identifier` parameter to the URL (Example: `/auth/open_id?openid_url=yahoo.com`).

A list of all OpenID stores is available at http://github.com/openid/ruby-openid/tree/master/lib/openid/store/

## OmniAuth Builder

If OpenID is one of several authentication strategies, use the OmniAuth Builder:

    require 'omniauth-openid'
    require 'openid/store/filesystem'

    use OmniAuth::Builder do
      provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp')
    end

## Configured Identifiers

You may pre-configure an OpenID identifier.  For example, to use Google's main OpenID endpoint:

    use OmniAuth::Builder do
      provider :open_id, nil, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
    end

Note the use of nil, which will trigger ruby-openid's default Memory Store.

## License

Copyright (c) 2011 Michael Bleigh and Intridea, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## 🤑 One more thing

You made it to the bottom of the page,
so perhaps you'll indulge me for another 20 seconds.
I maintain many dozens of gems, including this one,
because I want Ruby to be a great place for people to solve problems, big and small.
Please consider supporting my efforts via the giant yellow link below,
or one of the others at the head of this README.

[![Buy me a latte][🖇buyme-img]][🖇buyme]

[🖇buyme-img]: https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20latte&emoji=&slug=pboling&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff
[🖇buyme]: https://www.buymeacoffee.com/pboling
