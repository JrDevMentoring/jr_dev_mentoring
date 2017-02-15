class Connection < ActiveRecord::Base

  belongs_to :requester, class_name: 'User', inverse_of: :connections
  belongs_to :requested, class_name: 'User', inverse_of: :connection_requests

  validates_presence_of :requester, :requested
  validates_uniqueness_of :requested_id, scope: :requester_id

  before_create :send_connection_request

  def send_connection_request
    return unless requester && requested

    ConnectionMailer.connection_email(requester, requested).deliver_now
    ConnectionMailer.connection_email_copy(requester, requested).deliver_now
  end
end
