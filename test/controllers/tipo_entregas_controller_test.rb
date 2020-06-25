require 'test_helper'

class TipoEntregasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_entrega = tipo_entregas(:one)
  end

  test "should get index" do
    get tipo_entregas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_entrega_url
    assert_response :success
  end

  test "should create tipo_entrega" do
    assert_difference('TipoEntrega.count') do
      post tipo_entregas_url, params: { tipo_entrega: { entregado_por: @tipo_entrega.entregado_por } }
    end

    assert_redirected_to tipo_entrega_url(TipoEntrega.last)
  end

  test "should show tipo_entrega" do
    get tipo_entrega_url(@tipo_entrega)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_entrega_url(@tipo_entrega)
    assert_response :success
  end

  test "should update tipo_entrega" do
    patch tipo_entrega_url(@tipo_entrega), params: { tipo_entrega: { entregado_por: @tipo_entrega.entregado_por } }
    assert_redirected_to tipo_entrega_url(@tipo_entrega)
  end

  test "should destroy tipo_entrega" do
    assert_difference('TipoEntrega.count', -1) do
      delete tipo_entrega_url(@tipo_entrega)
    end

    assert_redirected_to tipo_entregas_url
  end
end
