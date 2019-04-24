require 'test_helper'

class CompletedCoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @completed_course = completed_courses(:one)
    @student = users(:student)
  end

  test "should get index if logged in" do
    sign_in @student

    get completed_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_completed_course_url
    assert_response :success
  end

  test "should create completed_course" do
    assert_difference('CompletedCourse.count') do
      post completed_courses_url, params: { completed_course: { course_id: @completed_course.course_id, user_id: @completed_course.user_id } }
    end

    assert_redirected_to completed_course_url(CompletedCourse.last)
  end

  test "should show completed_course" do
    get completed_course_url(@completed_course)
    assert_response :success
  end

  test "should get edit if signed in" do
    #sign_in @student

    get edit_completed_course_url(@completed_course)
    assert_response :success
  end

  test "should update completed_course" do
    patch completed_course_url(@completed_course), params: { completed_course: { course_id: @completed_course.course_id, user_id: @completed_course.user_id } }
    assert_redirected_to completed_course_url(@completed_course)
  end

  test "should destroy completed_course" do
    assert_difference('CompletedCourse.count', -1) do
      delete completed_course_url(@completed_course)
    end

    assert_redirected_to completed_courses_url
  end
end
