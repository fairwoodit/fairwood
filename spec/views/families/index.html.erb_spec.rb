require 'rails_helper'

RSpec.describe "families/index", :type => :view do
  before(:each) do
    assign(:families, [
      Family.create!(),
      Family.create!()
    ])
  end

  it "renders a list of families" do
    render
  end
end
