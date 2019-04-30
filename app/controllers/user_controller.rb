class UserController < ApplicationController

  # Require a logged-in user
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    # Get the declared program
    @declared_program = nil
    @courses_left = nil

    if @user.declared_programs.first
      @declared_program = @user.declared_programs.first.major

      # Track degree progress

      # Courses belonging to major
      @major_courses = []

      for req in Requirement.where(major_id: @declared_program.id)
          @course_reqs = CourseRequirement.where(requirement_id: req.id)

          for c_req in @course_reqs
            @major_courses.push(Course.where(id: c_req.course_id).first)
          end
      end

      # Courses completed by user
      @completed_courses = @user.completed_courses

      # Courses still needed for major
      @courses_left = []
      for course in @major_courses
        done = false
        for c_course in @completed_courses
          if c_course.course_id == course.id
            done = true
          end
        end
        if !done
          #test
          #@courses_left.push(course.title + ",")
          @courses_left.push(course)
        end
      end
    end

    # Make sure that user is viewing their own page
    if @user != current_user
      flash[:alert] = "You do not have permission to view this page."
      redirect_to(request.referrer || root_path)
    end
  end

end
