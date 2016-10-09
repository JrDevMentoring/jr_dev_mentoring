class ConnectionsController < AuthenticationController
  before_action :ensure_profile_availability

  def new
    connections_profile = Profile.find(params[:profile_id])
    requester_name = current_user.profile.first_name + " " + current_user.profile.last_name
    requester_email = current_user.profile.contact_email
    requested_name = connections_profile.first_name + ' ' + connections_profile.last_name
    requested_email = connections_profile.contact_email

    if ConnectionMailer.connection_email(requester_name, requester_email, requested_name, requested_email).deliver
      ConnectionMailer.connection_email_copy(requester_name, requester_email, requested_name, requested_email).deliver_now
      flash[:success] = "Message sent. Someone at Jr. Dev Mentoring will respond to your message soon. Thank you."
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
    flash[:danger] = "Please create a profile in order to connect with someone in the community."
    redirect_to :back unless current_user.profile
  end
end