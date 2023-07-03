class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :classroom, foreign_key: true
      t.string :days_of_week, array: true, default: []
      t.integer :duration, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false

      t.timestamps
    end
  end
end
