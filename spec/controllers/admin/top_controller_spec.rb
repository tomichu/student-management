require 'rails_helper'

describe Admin::TopController, 'Before Login' do
	let(:administrator) { create(:administrator) }
	
	describe 'IPアドレスによるアクセス制限' do
		before do
			Rails.application.config.baukis[:restrict_ip_addresses] = true
		end

		example '許可' do
			AllowedSource.create!(namespace: 'admin', ip_address: '0.0.0.0')
			get:index
			expect(response).to render_template('admin/top/index')
		end

		example '拒否' do
			AllowedSource.create!(namespace: 'admin', ip_address: '192.168.0.*')
			get :index
			expect(response).to render_template('errors/forbidden')
		end
	end
end

describe Admin::TopController, 'After logging in' do
	let(:administrator) {create(:administrator) }

	before do
		session[:administrator_id] = administrator.id
		session[:last_access_time] = 1.second.ago
	end

	describe '#index' do
		example 'Show admin/top/dashboard in the normal status' do
			get :index
			expect(response).to render_template('admin/top/dashboard')
		end

		example 'Force logout if the stop flag is set' do
			administrator.update_column(:suspended, true)
			get :index
			expect(session[:administrator_id]).to be_nil
			expect(response).to redirect_to(admin_root_url)
		end

		example 'Session Timeout' do
			session[:last_access_time] =
				Admin::Base::TIMEOUT.ago.advance(seconds: -1)
			get :index
			expect(session[:administrator_id]).to be_nil
			expect(response).to redirect_to(admin_login_url)
		end
	end
end



