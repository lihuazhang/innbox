# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'factory_girl'
FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]

require 'simplecov'
if ENV['CI']=='true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
SimpleCov.start 'rails' do
  add_filter 'lib/mails/version'
  add_filter 'lib/generators'
end

require File.expand_path("../dummy/config/environment", __FILE__)
ActiveRecord::Migrator.migrations_paths = [
  File.expand_path('../../db/migrate', __FILE__),
  File.expand_path("../dummy/db/migrate", __FILE__)
]

require "rails/test_help"
require 'minitest/mock'

FactoryGirl.find_definitions

# Mails.configure do
#   self.user_avatar_url_method = 'avatar_url'
# end

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load fixtures from the engine
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionView::TestCase
  include Rails.application.routes.url_helpers
end

class ActionDispatch::IntegrationTest
  def sign_in(user)
    post main_app.user_session_path \
      "user[email]"    => user.email,
      "user[password]" => user.password
  end

  def sign_in_session(user)
    open_session do |app|
      app.post main_app.user_session_path \
        'user[email]' => user.email,
        'user[password]' => user.password
      assert app.controller.user_signed_in?, "login_with_session #{user.email} 没有成功, #{app.flash[:alert]}"
    end
  end

  def assert_required_user
    assert_response :redirect
    assert_equal 'You need to sign in or sign up before continuing.', flash[:alert]
  end

  def assert_access_denied
    assert_response :redirect
    assert_equal 'Access denied.', flash[:alert]
  end
end
