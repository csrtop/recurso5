require "application_system_test_case"

class TipoEntregasTest < ApplicationSystemTestCase
  setup do
    @tipo_entrega = tipo_entregas(:one)
  end

  test "visiting the index" do
    visit tipo_entregas_url
    assert_selector "h1", text: "Tipo Entregas"
  end

  test "creating a Tipo entrega" do
    visit tipo_entregas_url
    click_on "New Tipo Entrega"

    fill_in "Entregado por", with: @tipo_entrega.entregado_por
    click_on "Create Tipo entrega"

    assert_text "Tipo entrega was successfully created"
    click_on "Back"
  end

  test "updating a Tipo entrega" do
    visit tipo_entregas_url
    click_on "Edit", match: :first

    fill_in "Entregado por", with: @tipo_entrega.entregado_por
    click_on "Update Tipo entrega"

    assert_text "Tipo entrega was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo entrega" do
    visit tipo_entregas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo entrega was successfully destroyed"
  end
end
