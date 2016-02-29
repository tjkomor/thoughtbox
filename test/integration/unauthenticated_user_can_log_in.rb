require "test_helper"

class UnauthenticatedUserCanSignUpTest < ActionDispatch::IntegrationTest
  test "unauthentivated user can sign up and gets redirected to links upon valid login" do
    visit root_path
    assert_equal "/login", current_path

    assert page.has_content?("Sign up")

    click_on "Sign Up"

    assert_equal "/users/new", current_path

    fill_in 'Username', with: 'tyler@tyler.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_on 'Sign Up'

    assert_equal "/links", current_path
    assert page.has_content?("Thoughtbox")
  end
end
