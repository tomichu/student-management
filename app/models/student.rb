class Student < ActiveRecord::Base
	belongs_to :customer

	GRADES = %w( 中1 中2 中3 高1 高2 高3 既卒 その他 )
	


end
