require 'rails_helper'

RSpec.describe "Walkathon::Payments", :type => :request do
  describe "GET /walkathon_payments" do
    it "works! (now write some real specs)" do
      get walkathon_payments_path
      expect(response).to have_http_status(200)
    end
  end
end
