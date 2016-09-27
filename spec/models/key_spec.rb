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

require 'rails_helper'

RSpec.describe Key, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
