class Staff::Base < ApplicationController
	before_action :check_source_ip_address
	before_action :authorize
	before_action :check_account
	before_action :check_timeout

	private
	def current_staff_member
		if session[:staff_member_id]
			@current_staff_member ||=
				StaffMember.find_by_id(session[:staff_member_id])
		end
	end

	helper_method :current_staff_member
	
	def check_source_ip_address
		raise IpAddressRejected unless AllowedSource.include?('staff', request.ip)
	end

	def authorize
		unless current_staff_member
			flash.alert = 'スタッフとしてログインしてください。'
			redirect_to :staff_login
		end
	end

	def check_account
		if current_staff_member && !current_staff_member.active?
			session.delete(:staff_member_id)
			flash.alert = "アカウントが無効になりました。"
			redirect_to :staff_root
		end
	end

	TIMEOUT = 60.minutes

	def check_timeout
		if current_staff_member
			if session[:last_access_time] >= TIMEOUT.ago
				session[:last_access_time] = Time.current
			else
				session.delete(:staff_member_id)
				flash.alert = '最後のアクセスから１時間以上経過しました。安全性向上の為、再度ログインしてください。'
				redirect_to :staff_login
			end
		end
	end
end


