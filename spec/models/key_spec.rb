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

require 'rails_helper'

RSpec.describe Key, type: :model do
  describe 'Validations'
  subject {FactoryBot.build(:key)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(5)}
  it {should validate_length_of(:name).is_at_most(100)}
  it {should validate_presence_of(:valid_from)}
  it {should validate_presence_of(:valid_until)}
  it {should validate_presence_of(:created_by)}
  it {should validate_presence_of(:updated_by)}
  it {should validate_presence_of(:group)}
  it {should validate_presence_of(:user)}
  it {should validate_uniqueness_of(:name).case_insensitive.scoped_to(:group_id)}
  it {should validate_uniqueness_of(:key_hash)}

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:key)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:key, name: nil)).to_not be_valid
  end

end
