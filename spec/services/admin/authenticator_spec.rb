require 'rails_helper'

describe Admin::Authenticator do
	describe '#authenticate' do
		example '正しいパスの時はtrueを返す' do
			m = build(:administrator)
			expect(Admin::Authenticator.new(m).authenticate('pw')).to be_truthy
		end

		example 'パスワードが間違っている時はfalse' do
			m = build(:administrator)
			expect(Admin::Authenticator.new(m).authenticate('xy')).to be_falsey
		end

		example 'パス未設定の場合もfalse' do
			m = build(:administrator, password: nil)
			expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
		end
			
		example 'サービス停止中はtrue' do
			m = build(:administrator, suspended: true)
			expect(Admin::Authenticator.new(m).authenticate('pw')).to be_truthy
		end
	
	end
end

