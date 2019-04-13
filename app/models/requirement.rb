class Requirement < ApplicationRecord

  belongs_to :major
  has_many :course_requirements
  has_many :courses, through: :course_requirements

  validates :name, presence: true
end
