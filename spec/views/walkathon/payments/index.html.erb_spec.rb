require 'rails_helper'

RSpec.describe "walkathon/payments/index", :type => :view do
  before(:each) do
    assign(:walkathon_payments, [
      Walkathon::Payment.create!(
        :description => "Description",
        :amount => "9.99",
        :walkathon_pledge => nil
      ),
      Walkathon::Payment.create!(
        :description => "Description",
        :amount => "9.99",
        :walkathon_pledge => nil
      )
    ])
  end

  it "renders a list of walkathon/payments" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
