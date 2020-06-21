require "application_system_test_case"

class ClubesTest < ApplicationSystemTestCase
  setup do
    @club = clubes(:one)
  end

  test "visiting the index" do
    visit clubes_url
    assert_selector "h1", text: "Clubes"
  end

  test "creating a Club" do
    visit clubes_url
    click_on "New Club"

    fill_in "No club", with: @club.no_club
    fill_in "Nombre", with: @club.nombre
    click_on "Create Club"

    assert_text "Club was successfully created"
    click_on "Back"
  end

  test "updating a Club" do
    visit clubes_url
    click_on "Edit", match: :first

    fill_in "No club", with: @club.no_club
    fill_in "Nombre", with: @club.nombre
    click_on "Update Club"

    assert_text "Club was successfully updated"
    click_on "Back"
  end

  test "destroying a Club" do
    visit clubes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Club was successfully destroyed"
  end
end
