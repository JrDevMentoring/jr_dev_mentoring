class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :choose_layout

	def routing_error(error = 'Routing error', status = :not_found, exception=nil)
		render json: "Unknown route, Routing Error", status: 404
	end

	def action_missing(m, *args, &block)
		Rails.logger.error(m)
		redirect_to '/*path'
	end

  def after_sign_in_path_for(resource)
    if current_user.plan.name == "mentor"
      mentor_root_path
    elsif current_user.plan.name == "mentee"
      mentee_root_path
    end
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  private
  def choose_layout
    return "application" if current_user.nil?
    if current_user.plan.name == 'mentor'
      'mentor_layout'
    elsif current_user.plan.name == 'mentee'
      'mentee_layout'
    end
  end
end


