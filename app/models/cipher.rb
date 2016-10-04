# == Schema Information
#
# Table name: ciphers
#
#  id          :integer          not null, primary key
#  secteur     :string(100)      not null
#  clef        :string(100)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  cipher_hash :string
#

class Cipher < ApplicationRecord
  #Filters
  before_save { self.cipher_hash = (BCrypt::Password.create(clef+secteur)).split(//).last(32).join }
  
  #Validations
  validates :clef, :secteur, presence: true, length: {maximum: 100}

  #Relations
  belongs_to :user
end
