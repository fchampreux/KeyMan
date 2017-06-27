# == Schema Information
#
# Table name: ciphers
#
#  id          :integer          not null, primary key
#  key         :string(100)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  cipher_hash :string
#  group_id    :integer
#  description :text
#  created_by  :string(100)
#  updated_by  :string(100)
#  valid_until :date
#  is_active   :boolean
#

class Cipher < ApplicationRecord
  #Filters
  before_save { self.cipher_hash = (BCrypt::Password.create(key+group.name)).split(//).last(32).join }
  
  #Validations
  validates :key, :valid_until, :group_id, :user_id, presence: true
  validates :key, length: {maximum: 100}

  #Relations
  belongs_to :group
  belongs_to :user
end
