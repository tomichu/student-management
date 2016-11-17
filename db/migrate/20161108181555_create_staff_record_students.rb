class CreateStaffRecordStudents < ActiveRecord::Migration
  def change
    create_table :staff_record_students do |t|
      t.string :title
      t.integer :ennea
      t.string :textbook
      t.string :going_school
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
