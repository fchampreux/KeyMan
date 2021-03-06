# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(100)      not null
#  first_name             :string(100)      not null
#  description            :text
#  is_admin               :boolean          default(FALSE)
#  pki                    :string(4000)
#  user_name              :string(30)       not null
#  language               :string(3)        not null
#  group_id               :integer          not null
#  role_id                :integer          not null
#  section                :string(100)      default("")
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
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  created_by             :string(100)
#  updated_by             :string(100)
#  is_active              :boolean          default(TRUE)
#  api_token              :string(100)
#  api_token_count        :integer          default(1)
#  api_token_validity     :datetime
#  authentication_token   :string(100)
#

class User < ApplicationRecord
  acts_as_token_authenticatable

  # Virtual attribute for authenticating by either user_name or email
  attr_accessor :login
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :zxcvbnable

  #Filters
#  before_save { self.email = email.downcase }
  before_save { self.email.downcase! }
  before_save { self.user_name.downcase! }
  before_create {self.created_by = created_by || 'Registration'}

  #Validations
  validates :name, :user_name, :first_name, :language, :role_id, presence: true
  validates :name, length: { minimum: 5, maximum: 100 }
  validates :user_name, length: { minimum: 5, maximum: 100 }
  validates :user_name, uniqueness: {case_sensitive: false }
  validates :group, presence: true
  #validates :created_by, :updated_by, presence: true
  #When changing group, should validate that user has no key assigned in former group

  #Relations
  belongs_to :role, :class_name => "Parameter", :foreign_key => "role_id"	# helps retrieving the role name
  belongs_to :group
  has_many :keys

  #Private functions definition
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  
end
