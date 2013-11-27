###
### Warden is needed to log users inside the test withouth having to manually visit login page and enters credentials every time
###

Warden.test_mode!
World Warden::Test::Helpers
After { Warden.test_reset! }

