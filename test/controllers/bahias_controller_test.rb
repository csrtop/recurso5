require 'test_helper'

class BahiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bahia = bahias(:one)
  end

  test "should get index" do
    get bahias_url
    assert_response :success
  end

  test "should get new" do
    get new_bahia_url
    assert_response :success
  end

  test "should create bahia" do
    assert_difference('Bahia.count') do
      post bahias_url, params: { bahia: { bahia: @bahia.bahia, club_id: @bahia.club_id } }
    end

    assert_redirected_to bahia_url(Bahia.last)
  end

  test "should show bahia" do
    get bahia_url(@bahia)
    assert_response :success
  end

  test "should get edit" do
    get edit_bahia_url(@bahia)
    assert_response :success
  end

  test "should update bahia" do
    patch bahia_url(@bahia), params: { bahia: { bahia: @bahia.bahia, club_id: @bahia.club_id } }
    assert_redirected_to bahia_url(@bahia)
  end

  test "should destroy bahia" do
    assert_difference('Bahia.count', -1) do
      delete bahia_url(@bahia)
    end

    assert_redirected_to bahias_url
  end
end
