require "test_helper"

class LogInControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get log_in_index_url
    assert_response :success
  end

  test "should get show" do
    get log_in_show_url
    assert_response :success
  end
end
