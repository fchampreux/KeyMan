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

class Key < ApplicationRecord
#Filters
  #before_save { self.key_hash = (BCrypt::Password.create(name+group.code)).split(//).last(KEY_SIZE/8).join }
  before_save { self.key_hash = (BCrypt::Password.create(name+group.code)).split(//).last(32).join }
  
#Validations
  validates :name, :valid_from, :valid_until, :created_at, :created_by, :updated_at, :updated_by, presence: true
  validates :name, length: {minimum: 5, maximum: 100}
  validates :name, uniqueness: {scope: :group_id, case_sensitive: false }
  validates :key_hash, uniqueness: true
  validates :group, presence: true
  validates :user, presence: true

#Relations
  belongs_to :group
  belongs_to :user
end
