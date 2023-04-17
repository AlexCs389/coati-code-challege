require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get add_data" do
    get home_add_data_url
    assert_response :success
  end

  test "should get import_new_data" do
    get home_import_new_data_url
    assert_response :success
  end

end
