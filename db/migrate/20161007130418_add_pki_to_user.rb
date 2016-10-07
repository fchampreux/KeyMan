class AddPkiToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pki, :string, limit: 4000
  end
end
