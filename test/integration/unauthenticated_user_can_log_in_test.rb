require "test_helper"

class UnauthenticatedUserCanSignUpTest < ActionDispatch::IntegrationTest
  test "unauthentivated user can sign up and gets redirected to links upon valid login" do
    create_user
    assert_equal "/links", current_path
    assert page.has_content?("Thoughtbox")
  end
end
