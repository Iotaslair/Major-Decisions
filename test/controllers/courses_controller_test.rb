require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @course = courses(:one)
    @student = users(:student)
    @faculty = users(:faculty)
  end

  test "should get index as student" do
    sign_in @student

    get courses_url
    assert_response :success
  end

  test "should get index as faculty" do
    sign_in @faculty

    get courses_url
    assert_response :success
  end

  test "should not get new as student" do
    sign_in @student

    get new_course_url
    assert_response :redirect
  end

  test "should get new as faculty" do
    sign_in @faculty

    get new_course_url
    assert_response :success
  end

  #TODO same as below, insert answer up here
  test "should not create course as student" do
    sign_in @student

    assert_difference('Course.count') do
      post courses_url, params: { course: { title: @course.title, description: @course.description } }
    end

    assert_redirected_to course_url(Course.last)
  end


  #TODO Fix this test, having trouble with requirement being set correctly
  test "should create course as faculty" do
    sign_in @faculty

    assert_difference('Course.count') do
      post courses_url, params: { course: { title: @course.title, description: @course.description, requirements: 1, requirement: 1  } }
    end

    assert_redirected_to course_url(Course.last)
  end


  test "should not show course when not logged in" do
    get course_url(@course)
    assert_response :redirect
  end

  test "should show course when logged in as student" do
    sign_in @student

    get course_url(@course)
    assert_response :success
  end

  test "should show course when logged in as faculty" do
    sign_in @student

    get course_url(@course)
    assert_response :success
  end



  test "should not get edit course when not logged in" do
    get edit_course_url(@course)
    assert_response :redirect
  end

  test "should not get edit course when logged in as student" do
    sign_in @student

    get edit_course_url(@course)
    assert_response :redirect
  end

  test "should get edit course when logged in as faculty" do
    sign_in @faculty

    get edit_course_url(@course)
    assert_response :success
  end

  test "should not update course when not logged in" do
    patch course_url(@course), params: { course: { description: @course.description, title: @course.title } }
    assert_response :redirect
  end

  test "should not update course when logged in as student" do
    sign_in @student

    patch course_url(@course), params: { course: { description: @course.description, title: @course.title } }
    assert_response :redirect
  end

  #TODO for some reason when going through the website to edit the course it fails and gives a rails error
  test "should not update course when logged in as faculty" do
    sign_in @faculty

    patch course_url(@course), params: { course: { description: @course.description, title: @course.title } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
