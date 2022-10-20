class CreateArtworkShare < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end

    add_index :artwork_shares, :artwork_id, unique: true
    add_index :artwork_shares, :viewer_id, unique: true

    add_foreign_key :artwork_shares, :artworks, 
    column: :artwork_id, primary_key: :id

    add_foreign_key :artwork_shares, :users,
    column: :viewer_id, primary_key: :id
  end
end
