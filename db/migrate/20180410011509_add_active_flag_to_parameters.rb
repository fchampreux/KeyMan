class AddActiveFlagToParameters < ActiveRecord::Migration[5.1]
  def change
    add_column :parameters, :is_active, :boolean, :default => true 
  end
end
