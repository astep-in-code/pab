require 'test_helper'

class BeersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get beers_new_url
    assert_response :success
  end

  test "should get show" do
    get beers_show_url
    assert_response :success
  end

end
