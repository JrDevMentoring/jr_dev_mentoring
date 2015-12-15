class UsersController < ApplicationController
  
  layout :choose_layout
  
  def show
    @user = User.find( params[:id] )
  end
  
  private
    def choose_layout   
      if current_user.plan.name == 'mentor'
       'mentor_layout'
      elsif current_user.plan.name == 'mentee'
       'mentee_layout'
      end
    end
end