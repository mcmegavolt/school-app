class CreateSectionsStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :sections_students, id: false do |t|
      t.references :section, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
