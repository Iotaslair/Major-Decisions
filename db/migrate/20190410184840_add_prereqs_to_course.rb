class AddPrereqsToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :course, foreign_key: true
  end
end
