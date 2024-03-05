require "test_helper"

class VisitesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get visites_new_url
    assert_response :success
  end

  test "should get create" do
    get visites_create_url
    assert_response :success
  end

  test "should get edit" do
    get visites_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get visites_destroy_url
    assert_response :success
  end

  test "should get update" do
    get visites_update_url
    assert_response :success
  end

  test "should get index" do
    get visites_index_url
    assert_response :success
  end

  test "should get show" do
    get visites_show_url
    assert_response :success
  end
end
