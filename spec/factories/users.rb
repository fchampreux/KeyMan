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

FactoryGirl.define do
  factory :user do
    name 'Tester'
    first_name 'First'
    language :en
    email { Faker::Internet.email }
    password "@1!2passwordX15!"
    password_confirmation "@1!2passwordX15!"
    confirmed_at Date.today
    group_id '1'
    role_id  '0'
    user_name 'Testing'
    created_at "2017.01.01"
    updated_at "2017.01.01"
    created_by "Factory"
    updated_by "Factory"
  end
end
