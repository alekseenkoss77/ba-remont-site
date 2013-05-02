require 'test_helper'

class CityControllerTest < ActionController::TestCase
  test "should get chose" do
    get :chose
    assert_response :success
  end

end
