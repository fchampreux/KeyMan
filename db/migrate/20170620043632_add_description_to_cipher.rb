class AddDescriptionToCipher < ActiveRecord::Migration[5.0]
  def change
    rename_column :ciphers, :clef, :key
    add_column :ciphers, :description, :text, limit: 1000
    add_column :ciphers, :created_by, :string, limit: 100
    add_column :ciphers, :updated_by, :string, limit: 100
    add_column :ciphers, :valid_until, :date
    add_column :ciphers, :is_active, :boolean
  end
end
