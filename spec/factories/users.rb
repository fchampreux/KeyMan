# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nom             :string(100)      not null
#  prenom          :string(100)      not null
#  section         :string(100)      not null
#  email           :string(200)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  is_admin        :boolean
#

FactoryGirl.define do
  factory :user do
    nom "MyString"
    prenom "MyString"
    section "MyString"
    email "MyString"
  end
end
