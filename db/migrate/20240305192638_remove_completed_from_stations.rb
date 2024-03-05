class RemoveCompletedFromStations < ActiveRecord::Migration[7.1]
  def change
    remove_column :stations, :completed?
  end
end
