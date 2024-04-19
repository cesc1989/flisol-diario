RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test, screen_size: [1440, 800]
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless, screen_size: [1440, 800]
  end
end
