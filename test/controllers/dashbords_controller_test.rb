require "test_helper"

class DashbordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashbords_index_url
    assert_response :success
  end
end
