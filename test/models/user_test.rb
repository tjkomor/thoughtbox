require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid with email, username, and password" do
    user = User.new(username: 'tyler',
                    password: "password",
                    email_address: "tyler@tyler.com")
    assert_equal user.username, 'tyler'
    assert_equal user.password, 'password'
    assert_equal user.email_address, 'tyler@tyler.com'
    assert user.valid?
  end

  test 'user is invalid without email_address' do
    user = User.new(username: 'tyler',
                    password: "password")
    assert user.invalid?
  end

  test 'user is invalid without username' do
    user = User.new(email_address: 'tyler@tyler.com',
                    password: "password")
    assert user.invalid?
  end

  test 'user is invalid without password' do
    user = User.new(email_address: 'tyler@tyler.com',
                    username: "tyler")
    assert user.invalid?
  end
end
