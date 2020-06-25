require "application_system_test_case"

class UbicacionesTest < ApplicationSystemTestCase
  setup do
    @ubicacion = ubicaciones(:one)
  end

  test "visiting the index" do
    visit ubicaciones_url
    assert_selector "h1", text: "Ubicaciones"
  end

  test "creating a Ubicacion" do
    visit ubicaciones_url
    click_on "New Ubicacion"

    fill_in "Ubicacion", with: @ubicacion.ubicacion
    click_on "Create Ubicacion"

    assert_text "Ubicacion was successfully created"
    click_on "Back"
  end

  test "updating a Ubicacion" do
    visit ubicaciones_url
    click_on "Edit", match: :first

    fill_in "Ubicacion", with: @ubicacion.ubicacion
    click_on "Update Ubicacion"

    assert_text "Ubicacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Ubicacion" do
    visit ubicaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ubicacion was successfully destroyed"
  end
end
