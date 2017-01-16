class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def routing_error(error = 'Routing error', status = :not_found, exception=nil)
		render json: "Unknown route, Routing Error", status: 404
	end

	def action_missing(m, *args, &block)
		Rails.logger.error(m)
		redirect_to '/*path'
	end

end


