class AddUserStamps < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :created_by, :string, limit: 100
    add_column :users, :updated_by, :string, limit: 100
    add_column :groups, :created_by, :string, limit: 100
    add_column :groups, :updated_by, :string, limit: 100
  end
end
