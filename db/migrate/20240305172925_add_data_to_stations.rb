class AddDataToStations < ActiveRecord::Migration[7.1]
  def change
    add_column :stations, :code_uic, :string
    add_column :stations, :name, :string
    add_column :stations, :fret, :string
    add_column :stations, :voyageurs, :string
    add_column :stations, :code_ligne, :string
    add_column :stations, :rg_troncon, :integer
    add_column :stations, :pk, :string
    add_column :stations, :ville, :string
    add_column :stations, :departement, :string
    add_column :stations, :x_geo, :string
    add_column :stations, :y_geo, :string
  end
end
