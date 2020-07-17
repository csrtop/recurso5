require "application_system_test_case"

class PasillosTest < ApplicationSystemTestCase
  setup do
    @pasillo = pasillos(:one)
  end

  test "visiting the index" do
    visit pasillos_url
    assert_selector "h1", text: "Pasillos"
  end

  test "creating a Pasillo" do
    visit pasillos_url
    click_on "New Pasillo"

    fill_in "Club", with: @pasillo.club_id
    fill_in "Pasillo", with: @pasillo.pasillo
    click_on "Create Pasillo"

    assert_text "Pasillo was successfully created"
    click_on "Back"
  end

  test "updating a Pasillo" do
    visit pasillos_url
    click_on "Edit", match: :first

    fill_in "Club", with: @pasillo.club_id
    fill_in "Pasillo", with: @pasillo.pasillo
    click_on "Update Pasillo"

    assert_text "Pasillo was successfully updated"
    click_on "Back"
  end

  test "destroying a Pasillo" do
    visit pasillos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pasillo was successfully destroyed"
  end
end
