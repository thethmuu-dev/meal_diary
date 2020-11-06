class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :meal_type, null: false
      t.integer :calories, null: false
      t.integer :proteins, null: false
      t.integer :carbohydrates, null: false
      t.integer :fats, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
