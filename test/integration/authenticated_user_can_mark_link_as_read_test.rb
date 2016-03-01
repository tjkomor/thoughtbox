require 'test_helper'
class AuthenticatedUserCanChangeStatusTest < ActionDispatch::IntegrationTest

  test "user can change read status to true" do
    skip
    create_user

    fill_in "Url", with: 'http://espn.go.com'
    fill_in "Title", with: 'ESPN'
    click_on "Submit"

    assert page.has_content?("ESPN")
    assert page.has_content?("Mark as Read")

    click_button "Mark as Read"

    assert page.has_content?('true')
  end
end
