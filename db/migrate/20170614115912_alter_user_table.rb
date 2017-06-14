class AlterUserTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :groupe_id, :group_id
  end
end
