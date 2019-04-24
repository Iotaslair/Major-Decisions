require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @student = users(:student)
    @faculty = users(:faculty)
  end

  test "should get show" do
    sign_in @student

    get user_url(@student)
    assert_response :success
  end

end
