class CreateVisites < ActiveRecord::Migration[7.1]
  def change
    create_table :visites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true
      t.timestamps
    end
  end
end
