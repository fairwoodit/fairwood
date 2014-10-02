require "rails_helper"

RSpec.describe Walkathon::PledgesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/walkathon/pledges").to route_to("walkathon/pledges#index")
    end

    it "routes to #new" do
      expect(:get => "/walkathon/pledges/new").to route_to("walkathon/pledges#new")
    end

    it "routes to #show" do
      expect(:get => "/walkathon/pledges/1").to route_to("walkathon/pledges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/walkathon/pledges/1/edit").to route_to("walkathon/pledges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/walkathon/pledges").to route_to("walkathon/pledges#create")
    end

    it "routes to #update" do
      expect(:put => "/walkathon/pledges/1").to route_to("walkathon/pledges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/walkathon/pledges/1").to route_to("walkathon/pledges#destroy", :id => "1")
    end

  end
end
