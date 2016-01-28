class ConnectionsController < ApplicationController #todo remove
  def new
    connections_profile = Profile.find(params[:profile_id])
    requester_name = current_user.profile.first_name + " " + current_user.profile.last_name
    requester_email = current_user.profile.contact_email
    requested_name = connections_profile.first_name + ' ' + connections_profile.last_name
    requested_email = connections_profile.contact_email

    # @connection = Connection.new

    # if @connection.save
      ConnectionMailer.connection_email(requester_name, requester_email, requested_name, requested_email).deliver
      flash[:success] = "Message sent. Someone at Jr. Dev Mentoring will respond to your message soon. Thank you."
      redirect_to :back
    # else
    #   flash[:danger] = "Error occured, message has not been sent. Please make sure that all appropriate form fields are completed."
    #   redirect_to new_connection_path
    # end
  end

  private
    def connection_params
      params.require(:connection).permit(:your_name, :email, :connections_name)
    end
end