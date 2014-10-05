require 'rails_helper'

RSpec.describe "teachers/new", :type => :view do
  before(:each) do
    assign(:teacher, Teacher.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new teacher form" do
    render

    assert_select "form[action=?][method=?]", teachers_path, "post" do

      assert_select "input#teacher_first_name[name=?]", "teacher[first_name]"

      assert_select "input#teacher_last_name[name=?]", "teacher[last_name]"

      assert_select "input#teacher_title[name=?]", "teacher[title]"
    end
  end
end
