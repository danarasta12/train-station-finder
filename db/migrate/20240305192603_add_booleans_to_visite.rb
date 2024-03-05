class AddBooleansToVisite < ActiveRecord::Migration[7.1]
  def change
    add_column :visites, :completed?, :boolean, default: false
  end
end
