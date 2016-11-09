require "rails_helper"

RSpec.describe InternshipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/internships").to route_to("internships#index")
    end

    it "routes to #new" do
      expect(:get => "/internships/new").to route_to("internships#new")
    end

    it "routes to #show" do
      expect(:get => "/internships/1").to route_to("internships#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/internships/1/edit").to route_to("internships#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/internships").to route_to("internships#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/internships/1").to route_to("internships#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/internships/1").to route_to("internships#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/internships/1").to route_to("internships#destroy", :id => "1")
    end

  end
end
