class ConnectionMailer < ActionMailer::Base

  def connection_email(requester_name, requester_email, requested_name, requested_email)
    @requester_name = requester_name
    @requester_email = requester_email
    @requested_name = requested_name
    @requested_email = requested_email
    mail(from: requester_email, to: @requested_email, subject: 'Great News! Someone From Jr. Dev Mentoring Wants To Connect')
  end

  def connection_email_copy(requester_name, requester_email, requested_name, requested_email)
    @requester_name = requester_name
    @requester_email = requester_email
    @requested_name = requested_name
    @requested_email = requested_email
    mail(from: requester_email, to: 'kmc3046@gmail.com', subject: 'Jr. Dev Mentoring Connect Form Message')
  end
end