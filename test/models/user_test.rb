require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "factory girl" do
    user = FactoryGirl.create(:user)
    assert_equal 0 , user.gender
  end
  
  test "authenticate" do
    user = FactoryGirl.create(:user, user_name: "yu5",
      password: "happy", password_confirmation: "happy")
    assert_nil User.authenticate("yu5", "lucky")
    assert_equal user, User.authenticate("yu5", "happy")
  end
end