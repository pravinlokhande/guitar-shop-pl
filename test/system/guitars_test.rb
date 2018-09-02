require "application_system_test_case"

class GuitarsTest < ApplicationSystemTestCase
  setup do
    @guitar = guitars(:one)
  end

  test "visiting the index" do
    visit guitars_url
    assert_selector "h1", text: "Guitars"
  end

  test "creating a Guitar" do
    visit guitars_url
    click_on "New Guitar"

    fill_in "Brand", with: @guitar.brand
    fill_in "Description", with: @guitar.description
    fill_in "Model", with: @guitar.model
    fill_in "Price", with: @guitar.price
    fill_in "Uid", with: @guitar.uid
    click_on "Create Guitar"

    assert_text "Guitar was successfully created"
    click_on "Back"
  end

  test "updating a Guitar" do
    visit guitars_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @guitar.brand
    fill_in "Description", with: @guitar.description
    fill_in "Model", with: @guitar.model
    fill_in "Price", with: @guitar.price
    fill_in "Uid", with: @guitar.uid
    click_on "Update Guitar"

    assert_text "Guitar was successfully updated"
    click_on "Back"
  end

  test "destroying a Guitar" do
    visit guitars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guitar was successfully destroyed"
  end
end
