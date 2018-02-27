# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  code        :string(30)       not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :string(100)
#  updated_by  :string(100)
#  is_active   :boolean          default(TRUE)
#

FactoryBot.define do
  factory :group do
    id          0
    name        "Test Group"
    description "This is a test group used for unit testing"
    code        "TEST"
    created_at  "2017.01.01"
    updated_at  "2017.01.01"
    created_by  "Factory"
    updated_by  "Factory"
  end

end
