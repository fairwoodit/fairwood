require 'rails_helper'

RSpec.describe "parents/new", :type => :view do
  before(:each) do
    assign(:parent, Parent.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :family => nil
    ))
  end

  it "renders new parent form" do
    render

    assert_select "form[action=?][method=?]", parents_path, "post" do

      assert_select "input#parent_first_name[name=?]", "parent[first_name]"

      assert_select "input#parent_last_name[name=?]", "parent[last_name]"

      assert_select "input#parent_email[name=?]", "parent[email]"

      assert_select "input#parent_family_id[name=?]", "parent[family_id]"
    end
  end
end
