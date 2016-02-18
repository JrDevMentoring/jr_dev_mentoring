class UsersController < AuthenticationController
  
  layout :choose_layout
  
  def show
    @user = User.find( params[:id] )
  end
  
  
   
end