module Uni
  class Response
    @@request_id_header_key = 'x-uni-request-id'

    attr_reader :raw, :status, :request_id, :code, :message, :data

    def initialize(response)
        @raw = response
        @status = response.status
        @headers = response.headers
        @body = response.body
        @request_id = @headers[@@request_id_header_key]
        @code = @body['code']
        @message = @body['message']
        @data = @body['data']

        if @status < 200 || @status >= 300 || @code != '0'
          raise UniError.new(@message || response.reason_phrase, self)
        end
    end

  end
end
