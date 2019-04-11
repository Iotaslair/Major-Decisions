class CreateMajors < ActiveRecord::Migration[5.2]
  def change
    create_table :majors do |t|
      t.string :title
      t.references :requirements, foreign_key: true

      t.timestamps
    end
  end
end
