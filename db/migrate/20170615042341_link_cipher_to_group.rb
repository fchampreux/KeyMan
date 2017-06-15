class LinkCipherToGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :ciphers, :sector, :string
    add_column :users, :role, :string, limit: 30
    add_column :users, :section, :string, limit: 100
    add_column :ciphers, :group_id, :integer
  end
end
