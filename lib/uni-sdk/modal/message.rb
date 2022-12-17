module Uni
    module Modal
        class Message
            def initialize(client)
                @client = client
            end

            def send(data={})
                @client.request('sms.message.send', data)
            end
        end
    end
end
