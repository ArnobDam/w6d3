class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :author_id, null: false
      t.integer :artwork_id, null: false

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :artwork_id

    add_foreign_key :comments, :users,
    column: :author_id, primary_key: :id

    add_foreign_key :comments, :artworks,
    column: :artwork_id, primary_key: :id
  end
end
