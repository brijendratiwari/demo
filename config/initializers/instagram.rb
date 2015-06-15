require "instagram"

Instagram.configure do |config|
  config.client_id = "19057f98e341414bb9397cfc94433594"
  config.client_secret = "683b3f026bee40829179d4743c4abc3b"
end

CALLBACK_URL = "http://localhost:3000/sessions/callbackurl"
