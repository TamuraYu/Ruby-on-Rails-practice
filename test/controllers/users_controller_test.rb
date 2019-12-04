require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "index" do
    login_as("yu5")
    get :index
    assert_response :success
  end

  test "index before login" do
    assert_raise(ApplicationController::Forbidden) { get :index }
  end
end