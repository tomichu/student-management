class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
			t.integer :registrant_id, null: false #register key
			t.string :title, null: false
			t.text :description
			t.datetime :application_start_time, null: false
			t.datetime :application_end_time, null: false
			t.integer :min_number_of_participants
			t.integer :max_number_of_participants
			
			t.timestamps
    end

		add_index :programs, :registrant_id
		add_index :programs, :application_start_time
		add_foreign_key :programs, :staff_members, column: 'registrant_id'
  end
end
