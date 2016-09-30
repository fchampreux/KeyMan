# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nom             :string(100)      not null
#  prenom          :string(100)      not null
#  section         :string(100)      not null
#  email           :string(200)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  is_admin        :boolean
#

class User < ApplicationRecord
  #Constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Filters
  before_save { self.email = email.downcase }
=begin  
  #Validations
  validates :nom, :section, presence: true, length: {maximum: 100}
  validates :prenom, presence: true, length: {maximum: 100}
  validates :email, presence: true, length: { maximum: 200 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
=end
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, :on => :create
  
  #Relations
  has_many :ciphers, :inverse_of => :user, :dependent => :destroy
  accepts_nested_attributes_for :ciphers, :reject_if => :all_blank, :allow_destroy => true
end
