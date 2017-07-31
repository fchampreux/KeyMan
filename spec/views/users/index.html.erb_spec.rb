require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :section => "Section",
        :email => "Email"
      ),
      User.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :section => "Section",
        :email => "Email"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Section".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
