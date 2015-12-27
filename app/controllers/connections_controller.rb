class ConnectionionsController < ApplicationController
  def new
    @connection = connection.new
  end
  
  def create
    @connection = Connection.new(connection_params)
    if @connection.save
      name = params[:connection][:your_name]
      email = params[:connection][:email]
      body = params[:connection][:mentors_name, :mentees_name]
      
      connectionMailer.connection_email(name, email, body).deliver
      flash[:success] = "Message sent. Someone at Jr. Dev Mentoring will respond to your message soon. Thank you."
      redirect_to new_connection_path
    else
      flash[:danger] = "Error occured, message has not been sent. You must complete all form fields"
      redirect_to new_connection_path
    end
  end
  private
    def connection_params
      params.require(:connection).permit(:your_name, :email, :mentors_name, :mentees_name)
    end
end