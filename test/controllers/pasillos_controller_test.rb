require 'test_helper'

class PasillosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pasillo = pasillos(:one)
  end

  test "should get index" do
    get pasillos_url
    assert_response :success
  end

  test "should get new" do
    get new_pasillo_url
    assert_response :success
  end

  test "should create pasillo" do
    assert_difference('Pasillo.count') do
      post pasillos_url, params: { pasillo: { club_id: @pasillo.club_id, pasillo: @pasillo.pasillo } }
    end

    assert_redirected_to pasillo_url(Pasillo.last)
  end

  test "should show pasillo" do
    get pasillo_url(@pasillo)
    assert_response :success
  end

  test "should get edit" do
    get edit_pasillo_url(@pasillo)
    assert_response :success
  end

  test "should update pasillo" do
    patch pasillo_url(@pasillo), params: { pasillo: { club_id: @pasillo.club_id, pasillo: @pasillo.pasillo } }
    assert_redirected_to pasillo_url(@pasillo)
  end

  test "should destroy pasillo" do
    assert_difference('Pasillo.count', -1) do
      delete pasillo_url(@pasillo)
    end

    assert_redirected_to pasillos_url
  end
end
