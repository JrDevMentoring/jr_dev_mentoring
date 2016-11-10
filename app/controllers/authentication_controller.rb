class AuthenticationController < ApplicationController

  before_action :authenticate_user!

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

end


