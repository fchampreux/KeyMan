class AlterUserModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :login, :string
    add_column :users, :user_name, :string, limit: 30
    remove_column :users, :password_digest, :string
    add_column :users, :language, :string, limit: 3
  end
end
