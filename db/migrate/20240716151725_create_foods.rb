class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.integer :category_id,  null: false
      t.string :food_name,     null: false
      t.integer :stock,        null: false
      t.integer :quantity_id,  null: false
      t.date :deadline,        null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
