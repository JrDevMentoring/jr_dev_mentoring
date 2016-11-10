require 'rails_helper'

RSpec.describe Internship, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:application_link) }
  it { is_expected.to validate_presence_of(:deadline) }
  it { is_expected.to validate_presence_of(:user) }

  describe '#active?' do
    it 'is true for active internships' do
      internship = create(:internship)
      expect(internship.active?).to be_truthy
    end

    it 'is false for active internships' do
      internship = create(:internship, deadline: Date.yesterday)
      expect(internship.active?).to be_falsey
    end
  end
end
