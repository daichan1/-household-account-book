require 'test_helper'

class HouseholdAccountBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get household_account_books_index_url
    assert_response :success
  end

end
