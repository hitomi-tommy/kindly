class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.json :images
      t.integer :status, null: false
      t.datetime :deadline
      t.integer :budget
      t.timestamps
    end
  end
end
