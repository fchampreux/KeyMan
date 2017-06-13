class CipherModelUpdate < ActiveRecord::Migration[5.0]
  def change
    rename_column :ciphers, :secteur, :sector
    remove_column :users, :section, :string
  end
end
