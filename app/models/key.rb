
class Key < ApplicationRecord
  #Filters
  before_save { self.key_hash = (BCrypt::Password.create(name+group.name)).split(//).last(32).join }
  
  #Validations
  validates :name, :valid_from, :valid_until, :group_id, :user_id, presence: true
  validates :name, length: {maximum: 100}

  #Relations
  belongs_to :group
  belongs_to :user
end
