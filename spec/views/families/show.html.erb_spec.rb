require 'rails_helper'

RSpec.describe "families/show", :type => :view do
  before(:each) do
    @family = assign(:family, Family.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
