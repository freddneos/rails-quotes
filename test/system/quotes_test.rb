require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit quotes_url
  #
  #   assert_selector "h1", text: "Quotes"
  # end
  setup do
    @quote = quotes(:first)
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name
    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_link "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Deleting a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_link "Delete", match: :first
    assert_selector "h1", text: "Quotes"
    assert_no_text @quote.name
  end

  test "Creating a new quote" do
  
    # When we visi the Quotes#index page
    # we expecte to see a title with the text "Quotes"

    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click on the link with the text "New Quote"
    # we expect to land on a page with the title "New quote"

    click_on "New quote"
    assert_selector "h1", text: "New quote"

    # When fill in the name input with "Capybara quote"
    # and we click on "Create quote"

    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    # We expect to be redirected back to the Quotes in the title page
    # and to see our "Capybara quote" in the list of quotes
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"

  end
end
