require 'rails_helper'

RSpec.describe "walkathon/payments/show", :type => :view do
  before(:each) do
    @walkathon_payment = assign(:walkathon_payment, Walkathon::Payment.create!(
      :description => "Description",
      :amount => "9.99",
      :walkathon_pledge => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
