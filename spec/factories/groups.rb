# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  code        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :group do
    id          0
    name        "Test Group"
    description "This is a test group used for unit testing"
    code        "TEST"
    
  end

end
