# == Schema Information
#
# Table name: keys
#
#  id         :integer          not null, primary key
#  secteur    :string(100)      not null
#  clef       :string(100)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  key_hash   :string
#

require 'rails_helper'

RSpec.describe Key, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
