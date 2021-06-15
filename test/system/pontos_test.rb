require "application_system_test_case"

class PontosTest < ApplicationSystemTestCase
  setup do
    @ponto = pontos(:one)
  end

  test "visiting the index" do
    visit pontos_url
    assert_selector "h1", text: "Pontos"
  end

  test "creating a Ponto" do
    visit pontos_url
    click_on "New Ponto"

    fill_in "Cliente", with: @ponto.cliente_id
    fill_in "Pontos", with: @ponto.pontos
    click_on "Create Ponto"

    assert_text "Ponto was successfully created"
    click_on "Back"
  end

  test "updating a Ponto" do
    visit pontos_url
    click_on "Edit", match: :first

    fill_in "Cliente", with: @ponto.cliente_id
    fill_in "Pontos", with: @ponto.pontos
    click_on "Update Ponto"

    assert_text "Ponto was successfully updated"
    click_on "Back"
  end

  test "destroying a Ponto" do
    visit pontos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ponto was successfully destroyed"
  end
end
