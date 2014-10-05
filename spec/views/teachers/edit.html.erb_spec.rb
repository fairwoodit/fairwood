require 'rails_helper'

RSpec.describe "teachers/edit", :type => :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit teacher form" do
    render

    assert_select "form[action=?][method=?]", teacher_path(@teacher), "post" do

      assert_select "input#teacher_first_name[name=?]", "teacher[first_name]"

      assert_select "input#teacher_last_name[name=?]", "teacher[last_name]"

      assert_select "input#teacher_title[name=?]", "teacher[title]"
    end
  end
end
