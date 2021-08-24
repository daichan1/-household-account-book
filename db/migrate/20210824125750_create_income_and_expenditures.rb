class CreateIncomeAndExpenditures < ActiveRecord::Migration[6.0]
  def change
    create_table :income_and_expenditures do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false, default: 0
      t.boolean :is_income_and_expenditure, default: true

      t.timestamps
    end
  end
end
