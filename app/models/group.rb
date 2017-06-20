# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  code        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ApplicationRecord
  has_many :users
  has_many :ciphers, :inverse_of => :user, :dependent => :destroy
  accepts_nested_attributes_for :ciphers, :reject_if => :all_blank, :allow_destroy => true
end
