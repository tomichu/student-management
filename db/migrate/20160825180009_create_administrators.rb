class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|

			t.string :email, null: false #MailAddress
			t.string :email_for_index, null: false #索引用メールアドレス
			t.string :hashed_password #password
			t.boolean :suspended, null: false, default: false  #名前カナ

      t.timestamps
    end

		add_index :administrators, :email_for_index, unique: true


  end
end
