require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

  setup do
    @student = users(:student)
    @faculty = users(:faculty)
  end

  test "should get show" do
    sign_in @student




    get user_show_url
    assert_response :success
  end

end
