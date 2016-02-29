require "test_helper"

class UnauthenticatedUserCanLogOutTest < ActionDispatch::IntegrationTest
  test "unauthentivated user can logout" do
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

    assert page.has_content?("Logout")

    click_on "Logout"

    assert page.has_content?("Login")
  end
end
