class ConnectionMailer < ActionMailer::Base
  default to: 'kimmcrayton@gmail.com'

  def connection_email(requester_name, requester_email, requested_name, requested_email)
    @requester_name = requester_name
    @requester_email = requester_email
    @requested_name = requested_name
    @requested_email = requested_email
    mail(from: requester_email, subject: 'Jr. Dev Mentoring Connect Form Message')
  end
end