require 'test_helper'

class DeclaredProgramsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @declared_program = declared_programs(:one)
    @student = users(:student)
    @faculty = users(:faculty)
  end
end
