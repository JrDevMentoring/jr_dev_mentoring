class UsersController < AuthenticationController
  
  def show
    @user = User.find( params[:id] )
  end
   
end