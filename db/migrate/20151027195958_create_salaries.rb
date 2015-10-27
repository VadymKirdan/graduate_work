class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.float :current_balance
      t.float :total_balance
      t.integer :user_id

      t.timestamps null: false
    end
  end
end