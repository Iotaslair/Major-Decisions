class CoursePolicy < ApplicationPolicy

  def new?
    return user.is_faculty?
  end

  def create?
    return user.is_faculty?
  end
end