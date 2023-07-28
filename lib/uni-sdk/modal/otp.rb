module Uni
    module Modal
        class Otp
            def initialize(client)
                @client = client
            end

            def send(data={})
                @client.request('otp.send', data)
            end

            def verify(data={})
                resp = @client.request('otp.verify', data)
                resp.valid = resp.data.nil? ? false : resp.data['valid']
                resp
            end
        end
    end
end
