# == Schema Information
#
# Table name: ciphers
#
#  id         :integer          not null, primary cipher
#  secteur    :string(100)      not null
#  clef       :string(100)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  cipher_hash   :string
#

FactoryGirl.define do
  factory :cipher do
    secteur "MyString"
    clef "MyString"
  end
end
