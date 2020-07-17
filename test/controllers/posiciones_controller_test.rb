require 'test_helper'

class PosicionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posicion = posiciones(:one)
  end

  test "should get index" do
    get posiciones_url
    assert_response :success
  end

  test "should get new" do
    get new_posicion_url
    assert_response :success
  end

  test "should create posicion" do
    assert_difference('Posicion.count') do
      post posiciones_url, params: { posicion: { bahia_id: @posicion.bahia_id, pasillo_id: @posicion.pasillo_id, pedido_id: @posicion.pedido_id } }
    end

    assert_redirected_to posicion_url(Posicion.last)
  end

  test "should show posicion" do
    get posicion_url(@posicion)
    assert_response :success
  end

  test "should get edit" do
    get edit_posicion_url(@posicion)
    assert_response :success
  end

  test "should update posicion" do
    patch posicion_url(@posicion), params: { posicion: { bahia_id: @posicion.bahia_id, pasillo_id: @posicion.pasillo_id, pedido_id: @posicion.pedido_id } }
    assert_redirected_to posicion_url(@posicion)
  end

  test "should destroy posicion" do
    assert_difference('Posicion.count', -1) do
      delete posicion_url(@posicion)
    end

    assert_redirected_to posiciones_url
  end
end
