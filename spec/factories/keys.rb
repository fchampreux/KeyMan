# == Schema Information
#
# Table name: keys
#
#  id         :integer          not null, primary key
#  secteur    :string(100)      not null
#  clef       :string(100)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  key_hash   :string
#

FactoryGirl.define do
  factory :key do
    secteur "MyString"
    clef "MyString"
  end
end
