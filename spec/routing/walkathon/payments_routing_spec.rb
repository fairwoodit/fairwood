require "rails_helper"

RSpec.describe Walkathon::PaymentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/walkathon/payments").to route_to("walkathon/payments#index")
    end

    it "routes to #new" do
      expect(:get => "/walkathon/payments/new").to route_to("walkathon/payments#new")
    end

    it "routes to #show" do
      expect(:get => "/walkathon/payments/1").to route_to("walkathon/payments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/walkathon/payments/1/edit").to route_to("walkathon/payments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/walkathon/payments").to route_to("walkathon/payments#create")
    end

    it "routes to #update" do
      expect(:put => "/walkathon/payments/1").to route_to("walkathon/payments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/walkathon/payments/1").to route_to("walkathon/payments#destroy", :id => "1")
    end

  end
end
