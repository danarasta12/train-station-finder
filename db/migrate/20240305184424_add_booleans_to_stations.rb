class AddBooleansToStations < ActiveRecord::Migration[7.1]
  def change
    add_column :stations, :completed?, :boolean, default: false
  end
end
