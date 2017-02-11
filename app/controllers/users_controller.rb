class UsersController < AuthenticationController

  def show
    @user = User.find( params[:id] )
    @connection = current_user.connections.find_by(requester_id: current_user.id, requested_id: @user.id)
  end

end
