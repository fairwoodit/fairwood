require 'rails_helper'

RSpec.describe "walkathon/pledges/show", :type => :view do
  before(:each) do
    @walkathon_pledge = assign(:walkathon_pledge, Walkathon::Pledge.create!(
      :sponsor_name => "Sponsor Name",
      :sponsor_phone => "Sponsor Phone",
      :pledge_per_lap => "9.99",
      :maximum_pledge => "9.99",
      :fixed_pledge => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sponsor Name/)
    expect(rendered).to match(/Sponsor Phone/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
