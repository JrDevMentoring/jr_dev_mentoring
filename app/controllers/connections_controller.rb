class ConnectionsController < AuthenticationController
  before_action :ensure_profile_availability

  def new
    requester = current_user
    requested = Profile.find(params[:profile_id]).user
    @connection = Connection.new(requester: requester, requested: requested)

    if @connection.save
      flash[:success] = "Congratulations! Your request to connect has been sent. The person your request has been sent to now has your email address and will contact you if they agree to this connection."
    else
      flash[:danger] = "Error occurred, message has not been sent. Please try again."
    end
    redirect_to :back
  end

  private
  def ensure_profile_availability
    if current_user.profile.nil?
      redirect_to :back, flash: {
        danger: "Please create a profile in order to connect with someone in the community."
      }
    end
  end
end
