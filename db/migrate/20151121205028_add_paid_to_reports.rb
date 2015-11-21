class AddPaidToReports < ActiveRecord::Migration
  def change
    add_column :reports, :paid, :boolean
  end
end
