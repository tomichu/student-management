class StaffMemberPresenter < ModelPresenter
	delegate :suspended?, to: :object
	def full_name
		object.family_name + ' ' + object.given_name
	end

	def full_name_kana
		object.family_name_kana + ' ' + object.given_name_kana
	end

	# スタッフの停止モード On/Offを表現する記号を返り値とする
	# On: BALLOT BOX WITH CHECK (U+2611)
	# Off: BALLOT BOX (U+2619)
	def suspended_mark
		suspended? ? raw('&#x2611;') : raw('&#x2610;')
	end
end

