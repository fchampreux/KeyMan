require 'rails_helper'

RSpec.describe "parameters/edit", type: :view do
  before(:each) do
    @parameter = assign(:parameter, Parameter.create!(
      :name => "MyString",
      : => "MyString",
      :description => "MyString",
      : => "MyText",
      :code => "MyString",
      : => "MyString",
      :value => "MyString",
      : => "MyString"
    ))
  end

  it "renders the edit parameter form" do
    render

    assert_select "form[action=?][method=?]", parameter_path(@parameter), "post" do

      assert_select "input#parameter_name[name=?]", "parameter[name]"

      assert_select "input#parameter_[name=?]", "parameter[]"

      assert_select "input#parameter_description[name=?]", "parameter[description]"

      assert_select "textarea#parameter_[name=?]", "parameter[]"

      assert_select "input#parameter_code[name=?]", "parameter[code]"

      assert_select "input#parameter_[name=?]", "parameter[]"

      assert_select "input#parameter_value[name=?]", "parameter[value]"

      assert_select "input#parameter_[name=?]", "parameter[]"
    end
  end
end
