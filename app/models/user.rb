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
#  role_id                :string           not null
#  section                :string(100)
#  created_at             :datetime         not null
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
#  updated_at             :datetime         not null
#  created_by             :string(100)
#  updated_by             :string(100)
#  is_active              :boolean          default(TRUE)
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
  has_many :ciphers
end
