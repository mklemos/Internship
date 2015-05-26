# Maximilian Lemos
# Invoca QA Internship Summer - 2015

# Resource: http://www.sitepoint.com/basics-capybara-improving-tests/
# Resource: https://gist.github.com/zhengjia/428105
# Resource: http://www.rubydoc.info/github/rspec/rspec-expectations/RSpec/Matchers
# Resource: http://www.rubydoc.info/github/jnicklas/capybara

# gems---------------------------------------------------------------

require 'rubygems'
require 'rspec'
require 'capybara'

# definitions--------------------------------------------------------

Capybara.default_driver = :selenium          # selenium opens actual browser, web driver
Capybara.app_host = "http://www.google.com"

class Google_test
  include Capybara::DSL                      # Domain Specific Language
  include RSpec::Matchers

  def search(text)
    visit "/"
    fill_in "q", :with => text
    click_button "Search"
  end

  def on_page(txt)
    page.should have_content(txt)
  end

end


# run----------------------------------------------------------------

google = Google_test.new                  # New object of Google_test class
google.search("Max")                      # String to be searched

if google.on_page("Max")
  puts "Success. We found 'Max' in this Google search. Goodbye."
else
  puts "String 'Max' not found. Goodbye."
  exit(-1)
end
