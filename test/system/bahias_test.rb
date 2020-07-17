require "application_system_test_case"

class BahiasTest < ApplicationSystemTestCase
  setup do
    @bahia = bahias(:one)
  end

  test "visiting the index" do
    visit bahias_url
    assert_selector "h1", text: "Bahias"
  end

  test "creating a Bahia" do
    visit bahias_url
    click_on "New Bahia"

    fill_in "Bahia", with: @bahia.bahia
    fill_in "Club", with: @bahia.club_id
    click_on "Create Bahia"

    assert_text "Bahia was successfully created"
    click_on "Back"
  end

  test "updating a Bahia" do
    visit bahias_url
    click_on "Edit", match: :first

    fill_in "Bahia", with: @bahia.bahia
    fill_in "Club", with: @bahia.club_id
    click_on "Update Bahia"

    assert_text "Bahia was successfully updated"
    click_on "Back"
  end

  test "destroying a Bahia" do
    visit bahias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bahia was successfully destroyed"
  end
end
