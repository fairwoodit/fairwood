require 'rails_helper'

RSpec.describe "walkathon/pledges/new", :type => :view do
  before(:each) do
    assign(:walkathon_pledge, Walkathon::Pledge.new(
      :sponsor_name => "MyString",
      :sponsor_phone => "MyString",
      :pledge_per_lap => "9.99",
      :maximum_pledge => "9.99",
      :fixed_pledge => "9.99"
    ))
  end

  it "renders new walkathon_pledge form" do
    render

    assert_select "form[action=?][method=?]", walkathon_pledges_path, "post" do

      assert_select "input#walkathon_pledge_sponsor_name[name=?]", "walkathon_pledge[sponsor_name]"

      assert_select "input#walkathon_pledge_sponsor_phone[name=?]", "walkathon_pledge[sponsor_phone]"

      assert_select "input#walkathon_pledge_pledge_per_lap[name=?]", "walkathon_pledge[pledge_per_lap]"

      assert_select "input#walkathon_pledge_maximum_pledge[name=?]", "walkathon_pledge[maximum_pledge]"

      assert_select "input#walkathon_pledge_fixed_pledge[name=?]", "walkathon_pledge[fixed_pledge]"
    end
  end
end
