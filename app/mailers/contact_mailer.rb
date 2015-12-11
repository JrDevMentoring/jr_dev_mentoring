class ContactMailer < ActionMailer::Base
  default to: 'info@jrdevmentoring.com'
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Jr. Dev Mentoring Contact Form Message')
  end
end