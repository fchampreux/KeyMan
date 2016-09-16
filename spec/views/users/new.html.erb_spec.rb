require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :nom => "MyString",
      :prenom => "MyString",
      :section => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_nom[name=?]", "user[nom]"

      assert_select "input#user_prenom[name=?]", "user[prenom]"

      assert_select "input#user_section[name=?]", "user[section]"

      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
