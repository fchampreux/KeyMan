
class AuditTrail < ApplicationRecord
#Filters

#Record validations
  validates :user_id, presence: true


#Record relations
  belongs_to :user
  
end
