require 'rails_helper'

RSpec.describe Internship, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:application_link) }
  it { is_expected.to validate_presence_of(:deadline) }
  it { is_expected.to validate_presence_of(:user) }


end
