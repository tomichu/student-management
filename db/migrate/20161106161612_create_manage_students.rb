class CreateManageStudents < ActiveRecord::Migration
  def change
    create_table :manage_students do |t|
			t.string :word
			t.string :grammer
			t.string :reading
			t.string :rapid_reading
			t.string :writing
			t.string :math

      t.timestamps
    end
		add_index :manage_students, :customer_id
  end
end
