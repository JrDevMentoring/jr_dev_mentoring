class ConnectionsMailer < ActionMailer::Base
    default to: 'info@jrdevmentoring.com'
    
    def connection_email(name, email, body)
        @name = name
        @email = email
        @body = body
        mail(from: email, subject: 'Jr. Dev Mentoring Connect Form Message')
    end
end