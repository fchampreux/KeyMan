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

FactoryBot.define do
  factory :parameter do
    id          0
    name        "Test Parameter"
    description "This is a test parameter used for unit testing"
    code        "TEST"
    value       "VALUE"
    created_at  "2017.01.01"
    updated_at  "2017.01.01"
    created_by  "Factory"
    updated_by  "Factory"
  end
end
