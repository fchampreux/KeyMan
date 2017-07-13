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
  pending "add some examples to (or delete) #{__FILE__}"
end
