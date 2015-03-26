class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :rank
      t.boolean :is_popular

      t.timestamps null: false
    end
  end
end
