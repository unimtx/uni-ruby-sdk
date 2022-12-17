require 'uni-sdk'

client = Uni::Client.new('your access key id', 'your access key secret')

begin
  resp = client.messages.send(
    to: 'your phone number', # in E.164 format
    signature: 'your sender name',
    content: 'Your verification code is 2048.'
  )
  puts resp.data
rescue Uni::UniError => e
  puts 'Exception: ' + e.message
end
