require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :nom => "MyString",
      :prenom => "MyString",
      :section => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_nom[name=?]", "user[nom]"

      assert_select "input#user_prenom[name=?]", "user[prenom]"

      assert_select "input#user_section[name=?]", "user[section]"

      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
