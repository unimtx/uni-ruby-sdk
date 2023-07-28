# Unimatrix Ruby SDK

[![Gem Version](https://img.shields.io/gem/v/uni-sdk.svg)](https://rubygems.org/gems/uni-sdk) [![Release](https://img.shields.io/github/release/unimtx/uni-ruby-sdk.svg)](https://github.com/unimtx/uni-ruby-sdk/releases/latest) [![GitHub license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/unimtx/uni-ruby-sdk/blob/main/LICENSE)

The Unimatrix Ruby SDK provides convenient access to integrate communication capabilities into your Ruby applications using the Unimatrix HTTP API. The SDK provides support for sending SMS, 2FA verification, and phone number lookup.

## Getting started

Before you begin, you need an [Unimatrix](https://www.unimtx.com/) account. If you don't have one yet, you can [sign up](https://www.unimtx.com/signup?s=ruby.sdk.gh) for an Unimatrix account and get free credits to get you started.

## Documentation

Check out the documentation at [unimtx.com/docs](https://www.unimtx.com/docs) for a quick overview.

## Installation

The recommended way to install the Unimatrix SDK for Ruby is to use the gem package manager, which is available on [RubyGems](https://rubygems.org/gems/uni-sdk).

Run the following command to add `uni-sdk` as a dependency to your project:

```bash
gem install uni-sdk
```

If you are installing via Bundler, add this line to your application's Gemfile:

```ruby
gem 'uni-sdk'
```

## Usage

The following example shows how to use the Unimatrix Ruby SDK to interact with Unimatrix services.

### Initialize a client

```ruby
require 'uni-sdk'

client = Uni::Client.new('your access key id', 'your access key secret')
```

or you can configure your credentials by environment variables:

```sh
export UNIMTX_ACCESS_KEY_ID=your_access_key_id
export UNIMTX_ACCESS_KEY_SECRET=your_access_key_secret
```

### Send SMS

Send a text message to a single recipient.

```ruby

require 'uni-sdk'

client = Uni::Client.new('your access key id', 'your access key secret')

begin
  resp = client.messages.send({
    to: '+1206880xxxx', # in E.164 format
    text: 'Your verification code is 2048.'
  })
  puts resp.data
rescue Uni::UniError => e
  puts 'Exception: ' + e.message
end
```

### Send verification code

Send a one-time passcode (OTP) to a recipient. The following example will automatically generate a verification code.

```ruby
require 'uni-sdk'

client = Uni::Client.new()

resp = client.otp.send({
  to: '+1206880xxxx'
})
puts resp.data
```

### Check verification code

Verify the one-time passcode (OTP) that a user provided. The following example will check whether the user-provided verification code is correct.

```ruby
require 'uni-sdk'

client = Uni::Client.new()

resp = client.otp.verify({
  to: '+1206880xxxx',
  code: '123456' # the code user provided
})
puts resp.valid
```

## Reference

### Other Unimatrix SDKs

To find Unimatrix SDKs in other programming languages, check out the list below:

- [Java](https://github.com/unimtx/uni-java-sdk)
- [Go](https://github.com/unimtx/uni-go-sdk)
- [Node.js](https://github.com/unimtx/uni-node-sdk)
- [Python](https://github.com/unimtx/uni-python-sdk)
- [PHP](https://github.com/unimtx/uni-php-sdk)
- [.NET](https://github.com/unimtx/uni-dotnet-sdk)

## License

This library is released under the [MIT License](https://github.com/unimtx/uni-ruby-sdk/blob/main/LICENSE).
