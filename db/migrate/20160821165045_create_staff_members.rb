class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
			t.string :email, null: false #MailAddress
			t.string :email_for_index, null: false #索引用メールアドレス
			t.string :family_name, null: false #苗字
			t.string :given_name, null: false #名前
			t.string :family_name_kana, null: false #苗字カナ
			t.string :given_name_kana, null: false #名前カナ
			t.string :hashed_password #password
			t.date :start_date, null: false #開始日
			t.date :end_date #名前カナ
			t.boolean :suspended, null: false, default: false  #名前カナ

      t.timestamps
    end

		add_index :staff_members, :email_for_index, unique: true
		add_index :staff_members, [ :family_name_kana, :given_name_kana ]


  end
end
