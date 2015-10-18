class AddTotalTimeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :total_time, :float
  end
end
