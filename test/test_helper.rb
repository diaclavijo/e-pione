ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all consultation_resources in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration consultation_resources
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all consultation_resources here...
end
