class AddColumnToContact < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :message, :text
    add_column :contacts, :mail, :string
  end
end
