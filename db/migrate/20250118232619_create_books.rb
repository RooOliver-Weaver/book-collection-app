class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :author, null: false, foreign_key: true
      t.string :cover
      t.text :description
      t.integer :year
      t.float :rating
      t.string :isbn
      t.boolean :read

      t.timestamps
    end
  end
end
