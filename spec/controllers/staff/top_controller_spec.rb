require 'rails_helper'

describe Staff::TopController, 'Before Login' do
	let(:staff_member) { create(:staff_member) }
	
	describe 'IPアドレスによるアクセス制限' do
		before do
			Rails.application.config.baukis[:restrict_ip_addresses] = true
		end

		example '許可' do
			AllowedSource.create!(namespace: 'staff', ip_address: '0.0.0.0')
			get:index
			expect(response).to render_template('staff/top/index')
		end

		example '拒否' do
			AllowedSource.create!(namespace: 'staff', ip_address: '192.168.0.*')
			get :index
			expect(response).to render_template('errors/forbidden')
		end
	end
end

describe Staff::TopController, 'After logging in' do
	let(:staff_member) {create(:staff_member) }

	before do
		session[:staff_member_id] = staff_member.id
		session[:last_access_time] = 1.second.ago
	end

	describe '#index' do
		example 'Show staff/top/dashboard in the normal status' do
			get :index
			expect(response).to render_template('staff/top/dashboard')
		end

		example 'Force logout if the stop flag is set' do
			staff_member.update_column(:suspended, true)
			get :index
			expect(session[:staff_member_id]).to be_nil
			expect(response).to redirect_to(staff_root_url)
		end

		example 'Session Timeout' do
			session[:last_access_time] =
				Staff::Base::TIMEOUT.ago.advance(seconds: -1)
			get :index
			expect(session[:staff_member_id]).to be_nil
			expect(response).to redirect_to(staff_login_url)
		end
	end
end



