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
#Filters
  before_save {self.code.upcase!}
#Record validations
  validates :name, :code, :created_by, :updated_by, presence: true
  validates :name, length: { minimum: 5, maximum: 100 }
  validates :code, length: { minimum: 3, maximum: 30 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :code, uniqueness: { case_sensitive: false }
#Record relations
  has_many :users, :inverse_of => :group
  has_many :keys, :inverse_of => :group
  accepts_nested_attributes_for :keys, :reject_if => :all_blank, :allow_destroy => false
  validates_associated :keys
end
