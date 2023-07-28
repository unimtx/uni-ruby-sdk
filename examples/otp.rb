require 'uni-sdk'

client = Uni::Client.new('your access key id', 'your access key secret')

# send a verification code to a recipient
begin
  resp = client.otp.send({
    to: 'your phone number' # in E.164 format
  })
  puts resp.data
rescue Uni::UniError => e
  puts 'Exception: ' + e.message
end

# verify a verification code
begin
  resp = client.otp.verify({
    to: 'your phone number', # in E.164 format
    code: 'the code you received'
  })
  puts resp.valid
rescue Uni::UniError => e
  puts 'Exception: ' + e.message
end
