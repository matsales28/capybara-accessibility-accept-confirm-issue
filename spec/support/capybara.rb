require "selenium/webdriver"

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium, using: :headless_chrome
  end

  config.before(:each, type: :system, visible_js: true) do
    driven_by :selenium, using: :chrome
  end

  config.before(:each, js: true) do
    Capybara.page.driver.browser.manage.window.resize_to(1920, 1080)
  end
end

Capybara.javascript_driver = :selenium_chrome_headless
Capybara.disable_animation = true
Capybara.enable_aria_label = true
Capybara.modify_selector :link do
  node_filter(:current, [String, Symbol], skip_if: nil) do |node, _value|
    node["aria-current"] == "page"
  end
end

