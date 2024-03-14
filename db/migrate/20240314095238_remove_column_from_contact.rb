class RemoveColumnFromContact < ActiveRecord::Migration[7.1]
  def change
    remove_column :contacts, :new, :string
    remove_column :contacts, :create, :string
  end
end
