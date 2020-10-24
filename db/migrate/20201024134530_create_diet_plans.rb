class CreateDietPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :diet_plans do |t|
      t.integer :calories
      t.integer :proteins
      t.integer :carbohydrates
      t.integer :fats
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
