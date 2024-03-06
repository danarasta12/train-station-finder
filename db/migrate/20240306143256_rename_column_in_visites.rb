class RenameColumnInVisites < ActiveRecord::Migration[7.1]
  def change
    rename_column :visites, :completed?, :completed
  end
end
