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

require 'rails_helper'

RSpec.describe User, type: :model do
  subject {FactoryGirl.build(:user)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(5)}
  it {should validate_length_of(:name).is_at_most(100)}
  it {should validate_presence_of(:user_name)}
  it {should validate_length_of(:user_name).is_at_least(5)}
  it {should validate_length_of(:user_name).is_at_most(100)}
  it {should validate_uniqueness_of(:user_name).case_insensitive}
  it {should validate_presence_of(:created_by)}
  it {should validate_presence_of(:updated_by)}
  it {should validate_presence_of(:group)}

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:user, name: nil)).to_not be_valid
  end


end
