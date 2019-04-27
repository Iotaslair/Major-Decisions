require 'test_helper'

class DeclaredProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @declared_program = declared_programs(:one)
  end

  test "should get index" do
    get declared_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_declared_program_url
    assert_response :success
  end

  test "should create declared_program" do
    assert_difference('DeclaredProgram.count') do
      post declared_programs_url, params: { declared_program: { major_id: @declared_program.major_id, user_id: @declared_program.user_id } }
    end

    assert_redirected_to declared_program_url(DeclaredProgram.last)
  end

  test "should show declared_program" do
    get declared_program_url(@declared_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_declared_program_url(@declared_program)
    assert_response :success
  end

  test "should update declared_program" do
    patch declared_program_url(@declared_program), params: { declared_program: { major_id: @declared_program.major_id, user_id: @declared_program.user_id } }
    assert_redirected_to declared_program_url(@declared_program)
  end

  test "should destroy declared_program" do
    assert_difference('DeclaredProgram.count', -1) do
      delete declared_program_url(@declared_program)
    end

    assert_redirected_to declared_programs_url
  end
end
