require 'test_helper'

class EstadospedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estadopedido = estadospedidos(:one)
  end

  test "should get index" do
    get estadospedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_estadopedido_url
    assert_response :success
  end

  test "should create estadopedido" do
    assert_difference('Estadopedido.count') do
      post estadospedidos_url, params: { estadopedido: { estado_id: @estadopedido.estado_id, pedido_id: @estadopedido.pedido_id } }
    end

    assert_redirected_to estadopedido_url(Estadopedido.last)
  end

  test "should show estadopedido" do
    get estadopedido_url(@estadopedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_estadopedido_url(@estadopedido)
    assert_response :success
  end

  test "should update estadopedido" do
    patch estadopedido_url(@estadopedido), params: { estadopedido: { estado_id: @estadopedido.estado_id, pedido_id: @estadopedido.pedido_id } }
    assert_redirected_to estadopedido_url(@estadopedido)
  end

  test "should destroy estadopedido" do
    assert_difference('Estadopedido.count', -1) do
      delete estadopedido_url(@estadopedido)
    end

    assert_redirected_to estadospedidos_url
  end
end
