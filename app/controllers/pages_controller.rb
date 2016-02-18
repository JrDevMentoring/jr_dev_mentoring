class PagesController < AuthenticationController
  
  skip_before_action :authenticate_user!
  
  def home
    @mentor_plan = Plan.find_by_name('mentor')
    @mentee_plan = Plan.find_by_name('mentee')
  end
  
  def about
  end
end