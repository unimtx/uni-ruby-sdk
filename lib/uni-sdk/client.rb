require 'faraday'

module Uni
    class Client
        @@name = 'uni-ruby-sdk'
        @@default_endpoint = 'https://api.unimtx.com'
        @@default_signing_algorithm = 'hmac-sha256'

        attr_accessor :access_key_id, :access_key_secret, :endpoint, :signing_algorithm

        def initialize(access_key_id=nil, access_key_secret=nil, endpoint=nil, signing_algorithm=nil)
            @access_key_id = access_key_id
            @access_key_secret = access_key_secret
            @endpoint = endpoint || @@default_endpoint
            @signing_algorithm = signing_algorithm || @@default_signing_algorithm
            @user_agent = @@name + '/' + Uni::VERSION
        end

        def _sign(query={})
            algorithm = @signing_algorithm.split('-')[1]
            query['algorithm'] = @signing_algorithm
            query['timestamp'] = Time.now.strftime('%s%L')
            query['nonce'] = rand(36**16).to_s(36)

            sorted_query = query.sort_by { |k, v| k.to_s }
            str_to_sign = URI.encode_www_form(sorted_query)

            query['signature'] = OpenSSL::HMAC.hexdigest(algorithm, @access_key_secret, str_to_sign)
        end

        def request(action, data={})
            query = {
                action: action,
                accessKeyId: @access_key_id
            }

            if !@access_key_secret.nil?
                _sign(query)
            end

            conn = Faraday.new(
                url: @endpoint,
                params: query,
                headers: {
                    'User-Agent': @user_agent,
                    'Content-Type': 'application/json;charset=utf-8',
                    'Accept': 'application/json',
                }
            ) do |f|
                f.response :json
            end

            response = conn.post('/', data.to_json)

            Uni::Response.new(response)
        end

        def messages()
            Uni::Modal::Message.new(self)
        end
    end
end
