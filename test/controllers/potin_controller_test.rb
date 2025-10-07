require "test_helper"

class PotinControllerTest < ActionDispatch::IntegrationTest
  test "should get pagedepotin" do
    get potin_pagedepotin_url
    assert_response :success
  end
end
