require 'rails_helper'

RSpec.describe "parameters/show", type: :view do
  before(:each) do
    @parameter = assign(:parameter, Parameter.create!(
      :name => "Name",
      : => "",
      :description => "Description",
      : => "MyText",
      :code => "Code",
      : => "",
      :value => "Value",
      : => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Value/)
    expect(rendered).to match(//)
  end
end
