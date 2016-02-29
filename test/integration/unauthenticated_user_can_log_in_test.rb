require "test_helper"

class UnauthenticatedUserCanSignUpTest < ActionDispatch::IntegrationTest
  test "unauthentivated user can sign up and gets redirected to links upon valid login" do
    visit root_path
    assert_equal "/", current_path

    assert page.has_content?("Sign Up")

    click_on "Sign Up"

    assert_equal "/users/new", current_path

    fill_in 'Username', with: 'tyler'
    fill_in 'Email address', with: 'tyler@tyler.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'
    assert_equal "/links", current_path
    assert page.has_content?("Thoughtbox")
  end
end
