ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  private
  # ログイン状態にする
  def login_as(user_name, admin = false)
    session[:id] = FactoryGirl.create(:user, user_name: user_name, admin: admin)
  end

  # ログアウト状態にする
  def logout
    session.delete(:id)
  end
end
