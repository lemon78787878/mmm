class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.date :deadline,        null: false
      t.string :dish,          null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
