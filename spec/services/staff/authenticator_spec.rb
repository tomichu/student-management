require 'rails_helper'

describe Staff::Authenticator do
	describe '#authenticate' do
		example '正しいパスの時はtrueを返す' do
			m = build(:staff_member)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
		end

		example 'パスワードが間違っている時はfalse' do
			m = build(:staff_member)
			expect(Staff::Authenticator.new(m).authenticate('xy')).to be_falsey
		end

		example 'パス未設定の場合もfalse' do
			m = build(:staff_member, password: nil)
			expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
		end
			
		example 'サービス停止中はtrue' do
			m = build(:staff_member, suspended: true)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
		end
	
		example 'サービス開始前もfalse' do
			m = build(:staff_member, start_date: Date.tomorrow)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
		end

		example 'サービス終了後もfalse' do
			m = build(:staff_member, end_date: Date.today)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
		end
	end
end

