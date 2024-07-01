require "test_helper"

class RelationShipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relation_ships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get relation_ships_destroy_url
    assert_response :success
  end
end
