require "application_system_test_case"

class EstadospedidosTest < ApplicationSystemTestCase
  setup do
    @estadopedido = estadospedidos(:one)
  end

  test "visiting the index" do
    visit estadospedidos_url
    assert_selector "h1", text: "Estadospedidos"
  end

  test "creating a Estadopedido" do
    visit estadospedidos_url
    click_on "New Estadopedido"

    fill_in "Estado", with: @estadopedido.estado_id
    fill_in "Pedido", with: @estadopedido.pedido_id
    click_on "Create Estadopedido"

    assert_text "Estadopedido was successfully created"
    click_on "Back"
  end

  test "updating a Estadopedido" do
    visit estadospedidos_url
    click_on "Edit", match: :first

    fill_in "Estado", with: @estadopedido.estado_id
    fill_in "Pedido", with: @estadopedido.pedido_id
    click_on "Update Estadopedido"

    assert_text "Estadopedido was successfully updated"
    click_on "Back"
  end

  test "destroying a Estadopedido" do
    visit estadospedidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estadopedido was successfully destroyed"
  end
end
