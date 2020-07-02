require 'test_helper'

class PedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido = pedidos(:one)
  end

  test "should get index" do
    get pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_pedido_url
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post pedidos_url, params: { pedido: { OMS: @pedido.OMS, club_id: @pedido.club_id, fecha_orden: @pedido.fecha_orden, no_items: @pedido.no_items, orden: @pedido.orden, responsable_id: @pedido.responsable_id, socio: @pedido.socio, tipo_entrega_id: @pedido.tipo_entrega_id, ubicacion_id: @pedido.ubicacion_id } }
    end

    assert_redirected_to pedido_url(Pedido.last)
  end

  test "should show pedido" do
    get pedido_url(@pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedido_url(@pedido)
    assert_response :success
  end

  test "should update pedido" do
    patch pedido_url(@pedido), params: { pedido: { OMS: @pedido.OMS, club_id: @pedido.club_id, fecha_orden: @pedido.fecha_orden, no_items: @pedido.no_items, orden: @pedido.orden, responsable_id: @pedido.responsable_id, socio: @pedido.socio, tipo_entrega_id: @pedido.tipo_entrega_id, ubicacion_id: @pedido.ubicacion_id } }
    assert_redirected_to pedido_url(@pedido)
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete pedido_url(@pedido)
    end

    assert_redirected_to pedidos_url
  end
end
