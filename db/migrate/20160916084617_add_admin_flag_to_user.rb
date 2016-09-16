class AddAdminFlagToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :boolean
    add_column :keys, :key_hash, :string
  end
end
