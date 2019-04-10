class CoursePolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    return user.faculty?
  end
end