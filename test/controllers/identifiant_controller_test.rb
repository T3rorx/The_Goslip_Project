require "test_helper"

class IdentifiantControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get identifiant_show_url
    assert_response :success
  end
end
