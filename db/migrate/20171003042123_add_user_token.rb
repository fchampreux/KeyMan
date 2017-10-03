class AddUserToken < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :api_token, :string, :limit => 100
    add_column :users, :api_token_count, :integer, :default => 1
    add_column :users, :api_token_validity, :datetime
  end
end
