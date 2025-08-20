require "test_helper"

class BragControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brag_path
    assert_response :success
  end
end
