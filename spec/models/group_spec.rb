# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  code        :string(30)       not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :string(100)
#  updated_by  :string(100)
#  is_active   :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:group)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(5)}
  it {should validate_length_of(:name).is_at_most(100)}
  it {should validate_presence_of(:code)}
  it {should validate_length_of(:code).is_at_least(3)}
  it {should validate_length_of(:code).is_at_most(30)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should validate_uniqueness_of(:code).case_insensitive}
  it {should validate_presence_of(:created_by)}
  it {should validate_presence_of(:updated_by)}

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:group)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:group, name: nil)).to_not be_valid
  end

end
