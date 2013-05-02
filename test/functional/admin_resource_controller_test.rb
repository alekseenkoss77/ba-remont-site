require 'test_helper'

class AdminResourceControllerTest < ActionController::TestCase
  test "should get copy" do
    get :copy
    assert_response :success
  end

end
