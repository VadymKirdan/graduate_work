class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :comment
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
