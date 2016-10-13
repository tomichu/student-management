class ErrorsController < ApplicationController
	def not_found
		raise ActionController::RoutingError,
			"No Route Matches #{request.path.inspect}"
	end

end
