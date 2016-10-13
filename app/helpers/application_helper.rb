module ApplicationHelper
	include HtmlBuilder

	def document_title
		if @title.present?
			"#{@title} - TJ Student Management System"
		else
			'TJ Student Management System'
		end
	end
end
