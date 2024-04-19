# Visit https://github.com/heartcombo/devise/?tab=readme-ov-file#test-helpers to find more test helpers
#
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :system
end
