# == Schema Information
#
# Table name: access_lists
#
#  id            :integer          not null, primary key
#  key_id        :integer          not null
#  user_id       :integer          not null
#  allow_encrypt :boolean          default(TRUE)
#  allow_decrypt :boolean          default(FALSE)
#  valid_from    :date             not null
#  valid_until   :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by    :string(100)
#  updated_by    :string(100)
#


class AccessList < ApplicationRecord
#Filters

#Record validations
  validates :user_id, :key_id, :valid_from, :valid_until, presence: true


#Record relations
  belongs_to :key
  
end
