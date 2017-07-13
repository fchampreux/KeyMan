# == Schema Information
#
# Table name: parameters
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  list_name   :string(100)
#  description :text
#  code        :string(30)       not null
#  value       :string(100)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :string(100)
#  updated_by  :string(100)
#

FactoryGirl.define do
  factory :parameter do
    name "MyString"
     "MyString"
    description "MyString"
     "MyText"
    code "MyString"
     "MyString"
    value "MyString"
     "MyString"
  end
end
