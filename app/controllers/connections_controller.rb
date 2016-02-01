class ConnectionsController < ApplicationController
  def new
    connections_profile = Profile.find(params[:profile_id])
    requester_name = current_user.profile.first_name + " " + current_user.profile.last_name
    requester_email = current_user.profile.contact_email
    requested_name = connections_profile.first_name + ' ' + connections_profile.last_name
    requested_email = connections_profile.contact_email

    if ConnectionMailer.connection_email(requester_name, requester_email, requested_name, requested_email).deliver
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
end