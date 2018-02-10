# == Schema Information
#
# Table name: audit_trails
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  action       :string           not null
#  object_id    :integer          not null
#  object_class :string(100)
#  object_name  :string(100)
#  server_name  :string(100)
#  table_name   :string(100)
#  column_name  :string(100)
#  description  :string(1000)
#  used_encrypt :boolean          default(FALSE)
#  used_decrypt :boolean          default(FALSE)
#  created_at   :datetime         not null
#  created_by   :string(100)
#


class AuditTrail < ApplicationRecord
#Filters

#Record validations
  validates :user_id, presence: true


#Record relations
  belongs_to :user
  
end
