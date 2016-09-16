class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.string :secteur , limit: 100    ,null: false
      t.string :clef    , limit: 100    ,null: false

      t.timestamps
    end
  end
end
