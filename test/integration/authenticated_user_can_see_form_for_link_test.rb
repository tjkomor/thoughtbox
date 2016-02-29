require "test_helper"

class AuthenticatedUserCanSeeFormLinkTest < ActionDispatch::IntegrationTest
  test "authenticated user can login and see a form for a new link" do
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

    visit root_path

    assert_equal "/", current_path

    assert page.has_content?("Login")

    click_on "Login"

    fill_in 'Username', with: 'tyler'
    fill_in 'Password', with: 'password'

    click_on 'Login'

    assert_equal "/links", current_path
    assert page.has_content?("Thoughtbox")
    assert page.has_content?('Url')
    assert page.has_content?('Title')
  end
end
