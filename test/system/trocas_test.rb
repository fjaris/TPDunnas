require "application_system_test_case"

class TrocasTest < ApplicationSystemTestCase
  setup do
    @troca = trocas(:one)
  end

  test "visiting the index" do
    visit trocas_url
    assert_selector "h1", text: "Trocas"
  end

  test "creating a Troca" do
    visit trocas_url
    click_on "New Troca"

    fill_in "Cliente", with: @troca.cliente_id
    fill_in "Produto", with: @troca.produto_id
    click_on "Create Troca"

    assert_text "Troca was successfully created"
    click_on "Back"
  end

  test "updating a Troca" do
    visit trocas_url
    click_on "Edit", match: :first

    fill_in "Cliente", with: @troca.cliente_id
    fill_in "Produto", with: @troca.produto_id
    click_on "Update Troca"

    assert_text "Troca was successfully updated"
    click_on "Back"
  end

  test "destroying a Troca" do
    visit trocas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Troca was successfully destroyed"
  end
end
