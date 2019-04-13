class Course < ApplicationRecord

  # Use ancestry gem for handling prereqs
  has_ancestry

  # Join table for linking to many possible requirement areas
  has_many :course_requirements
  has_many :requirements, through: :course_requirements

  # Validations
  validates :title, presence: true, uniqueness: true

end
