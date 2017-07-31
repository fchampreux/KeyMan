require 'rails_helper'

RSpec.describe "parameters/index", type: :view do
  before(:each) do
    assign(:parameters, [
      Parameter.create!(
        :name => "Name",
        : => "",
        :description => "Description",
        : => "MyText",
        :code => "Code",
        : => "",
        :value => "Value",
        : => ""
      ),
      Parameter.create!(
        :name => "Name",
        : => "",
        :description => "Description",
        : => "MyText",
        :code => "Code",
        : => "",
        :value => "Value",
        : => ""
      )
    ])
  end

  it "renders a list of parameters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
