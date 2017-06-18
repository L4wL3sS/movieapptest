require 'test_helper'

class SelectMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get select_movies_index_url
    assert_response :success
  end

end
