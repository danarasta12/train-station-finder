class AddColumnToStation < ActiveRecord::Migration[7.1]
  def change
    add_column :stations, :num_departement, :integer
  end
end
