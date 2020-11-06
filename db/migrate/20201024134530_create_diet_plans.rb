class CreateDietPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :diet_plans do |t|
      t.integer :calories, null: false
      t.integer :proteins, null: false
      t.integer :carbohydrates, null: false
      t.integer :fats, null: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
