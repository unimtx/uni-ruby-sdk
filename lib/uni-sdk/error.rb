module Uni
    class UniError < StandardError
        attr_reader :message, :response, :code, :request_id, :message

        def initialize(message, response=nil)
            @response = response
            @code = (response.nil? ? nil : response.code) || '-1'
            @request_id = response.nil? ? nil : response.request_id
            @message = '[' + @code + '] ' + message
        end

        def to_s
            message
        end
    end
end
