class AddUserIdToKey < ActiveRecord::Migration[5.0]
  def change
    add_column :keys, :user_id, :integer
  end
end
