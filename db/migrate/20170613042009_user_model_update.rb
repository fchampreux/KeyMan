class UserModelUpdate < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :nom, :name
    rename_column :users, :prenom, :first_name
    add_column :users, :groupe_id, :integer
  end
end
