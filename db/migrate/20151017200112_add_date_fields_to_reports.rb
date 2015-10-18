class AddDateFieldsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :day_off, :boolean
    add_column :reports, :date, :string
    add_column :reports, :time_start, :time
    add_column :reports, :time_end, :time
  end
end
