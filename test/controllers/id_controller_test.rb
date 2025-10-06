require "test_helper"

class IdControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get id_show_url
    assert_response :success
  end
end
