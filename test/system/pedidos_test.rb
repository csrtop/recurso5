require "application_system_test_case"

class PedidosTest < ApplicationSystemTestCase
  setup do
    @pedido = pedidos(:one)
  end

  test "visiting the index" do
    visit pedidos_url
    assert_selector "h1", text: "Pedidos"
  end

  test "creating a Pedido" do
    visit pedidos_url
    click_on "New Pedido"

    fill_in "Oms", with: @pedido.OMS
    fill_in "Club", with: @pedido.club_id
    fill_in "Fecha orden", with: @pedido.fecha_orden
    fill_in "No items", with: @pedido.no_items
    fill_in "Orden", with: @pedido.orden
    fill_in "Responsable", with: @pedido.responsable_id
    fill_in "Socio", with: @pedido.socio
    fill_in "Tipo entrega", with: @pedido.tipo_entrega_id
    fill_in "Ubicacion", with: @pedido.ubicacion_id
    click_on "Create Pedido"

    assert_text "Pedido was successfully created"
    click_on "Back"
  end

  test "updating a Pedido" do
    visit pedidos_url
    click_on "Edit", match: :first

    fill_in "Oms", with: @pedido.OMS
    fill_in "Club", with: @pedido.club_id
    fill_in "Fecha orden", with: @pedido.fecha_orden
    fill_in "No items", with: @pedido.no_items
    fill_in "Orden", with: @pedido.orden
    fill_in "Responsable", with: @pedido.responsable_id
    fill_in "Socio", with: @pedido.socio
    fill_in "Tipo entrega", with: @pedido.tipo_entrega_id
    fill_in "Ubicacion", with: @pedido.ubicacion_id
    click_on "Update Pedido"

    assert_text "Pedido was successfully updated"
    click_on "Back"
  end

  test "destroying a Pedido" do
    visit pedidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pedido was successfully destroyed"
  end
end
