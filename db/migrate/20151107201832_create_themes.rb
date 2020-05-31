class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :subject_id

      t.timestamps null: false
    end
    add_index :themes, :subject_id
  end
end
