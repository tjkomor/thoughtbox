require "test_helper"

class AuthenticatedUserCannotSubmitInvalidLinkTest < ActionDispatch::IntegrationTest
  test "authenticated user cannot submit invalid link" do
    create_user
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

    fill_in "Url", with: 'abcdefg'
    fill_in "Title", with: 'not gonna work'

    click_on "Submit"
    
    assert_equal "/links", current_path
    fill_in "Url", with: 'http://espn.go.com'
    fill_in "Title", with: 'ESPN'

    click_on "Submit"
    assert page.has_content?('ESPN')
  end
end
