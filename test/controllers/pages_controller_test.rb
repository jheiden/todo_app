require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get :home
    #get pages_home_url
    assert_response :success
  end

end
