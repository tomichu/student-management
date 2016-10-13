require 'rails_helper'

describe 'Routing' do
	example 'Staff Top Page' do
		expect(get: 'http://baukis.example.com').to route_to(
			host: 'baukis.example.com',
			controller: 'staff/top',
			action: 'index'
		)
	end
	example 'Admin Login Form' do
		expect(get: 'http://baukis.example.com/admin/login').to route_to(
			host: 'baukis.example.com',
			controller: 'admin/sessions',
			action: 'new'
		)
	end

	example 'Customer Top Page' do
		expect(get: 'http://example.com/mypage').to route_to(
			host: 'example.com',
			controller: 'customer/top',
			action: 'index'
		)
	end


	example 'ホスト名が対象外の場合、errors/not_foundへジャンプ' do
		expect(get: 'http://foo.example.jp').to route_to(
			controller: 'errors',
			action: 'not_found'
		)
	end
	example '存在しないPATHの場合、errors/not_foundへジャンプ' do
		expect(get: 'http://baukis.example.jp/xyz').to route_to(
			controller: 'errors',
			action: 'not_found',
			anything: 'xyz'
		)
	end
end
