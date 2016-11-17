class ManageStudent < ActiveRecord::Base
	validates :word, :grammer, :reading, :rapid_reading, presence: true
	belongs_to :customer
	WORDS = %w( DB1700 DB3000 DB4500 DB5500 TG1900 TG1000 )

	GRAMMERS = %w( 英文法ノート Forest 英語頻出問題740 基礎英文法問題精講
	英語頻出問題総演習 )

	validates :word, inclusion: { in: WORDS, allow_blank: true }
	validates :grammer, inclusion: { in: GRAMMERS, allow_blank: true }

end
