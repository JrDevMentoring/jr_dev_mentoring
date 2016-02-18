class ContactsController < AuthenticationController
  
  skip_before_action :authenticate_user!
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Message sent. Someone at Jr. Dev Mentoring will respond to your message soon. Thank you."
      redirect_to new_contact_path
    else
      flash[:danger] = "Error occured, message has not been sent. You must complete all form fields"
      redirect_to new_contact_path
    end
  end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end