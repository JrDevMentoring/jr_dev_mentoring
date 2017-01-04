class PagesController < AuthenticationController

  skip_before_action :authenticate_user!
  before_action :redirect_if_current_user

  def home
    @mentor_plan = Plan.find_by_name('mentor')
    @mentee_plan = Plan.find_by_name('mentee')
  end

  def about
  end

  private
  def redirect_if_current_user
    if current_user
      path = after_sign_in_path_for(current_user)
      redirect_to path
    end
  end
end
