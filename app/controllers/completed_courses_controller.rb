class CompletedCoursesController < ApplicationController

  # Require user to be logged in
  before_action :authenticate_user!

  before_action :set_completed_course, only: [:show, :edit, :update, :destroy]

  # GET /completed_courses
  # GET /completed_courses.json
  def index
    if current_user.faculty?
      @completed_courses = CompletedCourse.all
    else
      @completed_courses = CompletedCourse.where(user_id: current_user)
    end
  end

  # GET /completed_courses/1
  # GET /completed_courses/1.json
  def show
  end

  # GET /completed_courses/new
  def new
    @completed_course = CompletedCourse.new
  end

  # GET /completed_courses/1/edit
  def edit
  end

  # POST /completed_courses
  # POST /completed_courses.json
  def create
    @completed_course = CompletedCourse.new(completed_course_params)

    # TODO: Don't allow user to specify a course as completed if the user has ALREADY completed it

    respond_to do |format|
      if @completed_course.save
        format.html {redirect_to @completed_course, notice: 'Completed course was successfully created.'}
        format.json {render :show, status: :created, location: @completed_course}
      else
        format.html {render :new}
        format.json {render json: @completed_course.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /completed_courses/1
  # PATCH/PUT /completed_courses/1.json
  def update
    respond_to do |format|
      if @completed_course.update(completed_course_params)
        format.html {redirect_to @completed_course, notice: 'Completed course was successfully updated.'}
        format.json {render :show, status: :ok, location: @completed_course}
      else
        format.html {render :edit}
        format.json {render json: @completed_course.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /completed_courses/1
  # DELETE /completed_courses/1.json
  def destroy
    @completed_course.destroy
    respond_to do |format|
      format.html {redirect_to completed_courses_url, notice: 'Completed course was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_completed_course
    @completed_course = CompletedCourse.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def completed_course_params
    params.require(:completed_course).permit(:user, :user_id, :course_id)
  end
end
