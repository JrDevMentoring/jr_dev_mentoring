require 'rails_helper'

RSpec.describe "Internships", type: :request do
  describe "GET /internships" do
    it "works! (now write some real specs)" do
      get internships_path
      expect(response).to have_http_status(200)
    end
  end
end
