class ManageStudentPresenter < ModelPresenter
	delegate :word, :grammer, to: :object
	def word
	end

	def grammer
	end

end
