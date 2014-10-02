require 'rails_helper'

RSpec.describe "walkathon/pledges/index", :type => :view do
  before(:each) do
    assign(:walkathon_pledges, [
      Walkathon::Pledge.create!(
        :sponsor_name => "Sponsor Name",
        :sponsor_phone => "Sponsor Phone",
        :pledge_per_lap => "9.99",
        :maximum_pledge => "9.99",
        :fixed_pledge => "9.99"
      ),
      Walkathon::Pledge.create!(
        :sponsor_name => "Sponsor Name",
        :sponsor_phone => "Sponsor Phone",
        :pledge_per_lap => "9.99",
        :maximum_pledge => "9.99",
        :fixed_pledge => "9.99"
      )
    ])
  end

  it "renders a list of walkathon/pledges" do
    render
    assert_select "tr>td", :text => "Sponsor Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sponsor Phone".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
