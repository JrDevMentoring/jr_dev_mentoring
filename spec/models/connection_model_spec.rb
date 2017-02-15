require 'rails_helper'

describe Connection do
  it { is_expected.to validate_presence_of(:requester) }
  it { is_expected.to validate_presence_of(:requested) }
  it { is_expected.to validate_uniqueness_of(:requested_id).scoped_to :requester_id }

  it 'should send email and copy when created' do
    expect { create(:connection) }
      .to change { ActionMailer::Base.deliveries.count }.by 2
  end
end