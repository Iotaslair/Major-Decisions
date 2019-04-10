class Course < ApplicationRecord

  has_many :prereqs, class_name: "Course", foreign_key: "prereqs_id"
  belongs_to :parent, class_name: "Course", optional: true

  validates :title, presence: true, uniqueness: true

end
