# == Schema Information
#
# Table name: keys
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :text
#  group_id    :integer
#  user_id     :integer
#  key_hash    :string(256)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :string(100)
#  updated_by  :string(100)
#  valid_from  :date             not null
#  valid_until :date             not null
#  is_active   :boolean          default(TRUE)
#

FactoryGirl.define do
  factory :key do
    name "Test key"
    description "This key is used for unit testing"
    group_id 1
    user_id 1
    created_at "2017.01.01"
    updated_at "2017.01.01"
    valid_from "2017.01.01"
    valid_until "2077.01.01"
    created_by "Factory"
    updated_by "Factory"
  end
end
