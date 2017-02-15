class ConnectionMailer < ActionMailer::Base

  def connection_email(requester, requested)
    @requester_name = requester.profile.first_name + ' ' + requester.profile.last_name
    @requester_email = requester.email
    @requested_name = requested.profile.first_name + ' ' + requested.profile.last_name
    @requested_email = requested.email
    mail(from: @requester_email, to: @requested_email, subject: 'Great News! Someone From Jr. Dev Mentoring Wants To Connect')
  end

  def connection_email_copy(requester, requested)
    @requester_name = requester.profile.first_name + ' ' + requester.profile.last_name
    @requester_email = requester.email
    @requested_name = requested.profile.first_name + ' ' + requested.profile.last_name
    @requested_email = requested.email
    mail(from: @requester_email, to: 'kmc3046@gmail.com', subject: 'Jr. Dev Mentoring Connect Form Message')
  end
end