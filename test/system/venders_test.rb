require "application_system_test_case"

class VendersTest < ApplicationSystemTestCase
  setup do
    @vender = venders(:one)
  end

  test "visiting the index" do
    visit venders_url
    assert_selector "h1", text: "Venders"
  end

  test "creating a Vender" do
    visit venders_url
    click_on "New Vender"

    fill_in "Cliente", with: @vender.cliente_id
    fill_in "Produto", with: @vender.produto_id
    click_on "Create Vender"

    assert_text "Vender was successfully created"
    click_on "Back"
  end

  test "updating a Vender" do
    visit venders_url
    click_on "Edit", match: :first

    fill_in "Cliente", with: @vender.cliente_id
    fill_in "Produto", with: @vender.produto_id
    click_on "Update Vender"

    assert_text "Vender was successfully updated"
    click_on "Back"
  end

  test "destroying a Vender" do
    visit venders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vender was successfully destroyed"
  end
end
