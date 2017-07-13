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

class Group < ApplicationRecord
  has_many :users
  has_many :ciphers, :inverse_of => :group, :dependent => :destroy
  accepts_nested_attributes_for :ciphers, :reject_if => :all_blank, :allow_destroy => true
end
