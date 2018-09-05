require 'test_helper'

class MyPlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_players_index_url
    assert_response :success
  end

  test "should get show" do
    get my_players_show_url
    assert_response :success
  end

end
