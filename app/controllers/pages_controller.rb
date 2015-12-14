class PagesController < ApplicationController
  
  skip_before_action :authenticate_user!
  
  def home
    @mentor_plan = Plan.find(1)
    @mentee_plan = Plan.find(2)
  end
  
  def about
  end
end