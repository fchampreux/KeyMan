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

class Parameter < ApplicationRecord
    
#Validations
  validates :name, :code, presence: true
  validates :name, length: { minimum: 5, maximum: 100 }
  validates :code, length: { minimum: 1, maximum: 30 }
  validates :name, uniqueness: {case_sensitive: false }
  validates :code, uniqueness: {case_sensitive: false }
end
