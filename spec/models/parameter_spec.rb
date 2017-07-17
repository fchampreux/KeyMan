# == Schema Information
#
# Table name: parameters
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  list_name   :string(100)
#  description :text
#  code        :string(30)       not null
#  value       :string(100)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :string(100)
#  updated_by  :string(100)
#

require 'rails_helper'

RSpec.describe Parameter, type: :model do
  
  describe 'Validations'
  subject {FactoryGirl.build(:parameter)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(5)}
  it {should validate_length_of(:name).is_at_most(100)}
  it {should validate_presence_of(:code)}
  it {should validate_length_of(:code).is_at_least(3)}
  it {should validate_length_of(:code).is_at_most(30)}
  it {should validate_presence_of(:value)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should validate_uniqueness_of(:code).case_insensitive}
  it {should validate_presence_of(:created_at)}
  it {should validate_presence_of(:created_by)}
  it {should validate_presence_of(:updated_at)}
  it {should validate_presence_of(:updated_by)}

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:parameter)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:parameter, name: nil)).to_not be_valid
  end

end
