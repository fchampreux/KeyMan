# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(100)      not null
#  first_name             :string(100)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean
#  pki                    :string(4000)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  user_name              :string(30)
#  language               :string(3)
#  group_id               :integer
#

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :zxcvbnable

  #Filters
  before_save { self.email = email.downcase }

  #Validations
  validates :name, :first_name, :group_id, presence: true, length: {maximum: 100}

  #Relations
  belongs_to :group
  has_many :ciphers, :inverse_of => :user, :dependent => :destroy
  accepts_nested_attributes_for :ciphers, :reject_if => :all_blank, :allow_destroy => true

end
