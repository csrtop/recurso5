require 'test_helper'

class ClubesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club = clubes(:one)
  end

  test "should get index" do
    get clubes_url
    assert_response :success
  end

  test "should get new" do
    get new_club_url
    assert_response :success
  end

  test "should create club" do
    assert_difference('Club.count') do
      post clubes_url, params: { club: { no_club: @club.no_club, nombre: @club.nombre } }
    end

    assert_redirected_to club_url(Club.last)
  end

  test "should show club" do
    get club_url(@club)
    assert_response :success
  end

  test "should get edit" do
    get edit_club_url(@club)
    assert_response :success
  end

  test "should update club" do
    patch club_url(@club), params: { club: { no_club: @club.no_club, nombre: @club.nombre } }
    assert_redirected_to club_url(@club)
  end

  test "should destroy club" do
    assert_difference('Club.count', -1) do
      delete club_url(@club)
    end

    assert_redirected_to clubes_url
  end
end
