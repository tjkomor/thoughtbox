require "test_helper"

class UnauthenticatedUserCanLogOutTest < ActionDispatch::IntegrationTest
  test "unauthentivated user can logout" do
    create_user
    assert_equal "/links", current_path
    assert page.has_content?("Thoughtbox")

    assert page.has_content?("Logout")

    click_on "Logout"

    assert page.has_content?("Login")
    assert_equal "/", current_path
  end
end
