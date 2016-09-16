class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nom     , limit: 100    ,null: false
      t.string :prenom  , limit: 100    ,null: false
      t.string :section , limit: 100    ,null: false
      t.string :email   , limit: 200    ,null: false

      t.timestamps
    end
  end
end
