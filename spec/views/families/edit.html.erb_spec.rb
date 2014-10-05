require 'rails_helper'

RSpec.describe "families/edit", :type => :view do
  before(:each) do
    @family = assign(:family, Family.create!())
  end

  it "renders the edit family form" do
    render

    assert_select "form[action=?][method=?]", family_path(@family), "post" do
    end
  end
end
