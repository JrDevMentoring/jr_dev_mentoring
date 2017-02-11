class ConnectionsController < AuthenticationController
  before_action :ensure_profile_availability

  def new
    @connection = Connection.new
    connections_profile = Profile.find(params[:profile_id])

    requester_name = current_user.profile.first_name + " " + current_user.profile.last_name
    requester_email = current_user.profile.contact_email
    @connection.requester_id = current_user.id

    requested_name = connections_profile.first_name + ' ' + connections_profile.last_name
    requested_email = connections_profile.contact_email
    @connection.requested_id = connections_profile.user.id

    if ConnectionMailer.connection_email(requester_name, requester_email, requested_name, requested_email).deliver_now
      ConnectionMailer.connection_email_copy(requester_name, requester_email, requested_name, requested_email).deliver_now
      flash[:success] = "Congratulations! Your request to connect has been sent. The person your request has been sent to now has your email address and will contact you if they agree to this connection."
      @connection.save
    else
      flash[:danger] = "Error occurred, message has not been sent. Please try again."
    end
    redirect_to :back
  end

  private
    def connection_params
      params.require(:connection).permit(:your_name, :email, :connections_name)
    end

    def ensure_profile_availability
      if current_user.profile.nil?
        redirect_to :back, flash: {
          danger: "Please create a profile in order to connect with someone in the community."
        }
      end
    end
end
