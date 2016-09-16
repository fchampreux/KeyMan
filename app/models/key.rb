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

class Key < ApplicationRecord
  #Validations
  validates :clef, :secteur, presence: true, length: {maximum: 100}

  #Relations
  belongs_to :user
end
