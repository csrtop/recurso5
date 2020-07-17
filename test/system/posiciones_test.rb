require "application_system_test_case"

class PosicionesTest < ApplicationSystemTestCase
  setup do
    @posicion = posiciones(:one)
  end

  test "visiting the index" do
    visit posiciones_url
    assert_selector "h1", text: "Posiciones"
  end

  test "creating a Posicion" do
    visit posiciones_url
    click_on "New Posicion"

    fill_in "Bahia", with: @posicion.bahia_id
    fill_in "Pasillo", with: @posicion.pasillo_id
    fill_in "Pedido", with: @posicion.pedido_id
    click_on "Create Posicion"

    assert_text "Posicion was successfully created"
    click_on "Back"
  end

  test "updating a Posicion" do
    visit posiciones_url
    click_on "Edit", match: :first

    fill_in "Bahia", with: @posicion.bahia_id
    fill_in "Pasillo", with: @posicion.pasillo_id
    fill_in "Pedido", with: @posicion.pedido_id
    click_on "Update Posicion"

    assert_text "Posicion was successfully updated"
    click_on "Back"
  end

  test "destroying a Posicion" do
    visit posiciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Posicion was successfully destroyed"
  end
end
