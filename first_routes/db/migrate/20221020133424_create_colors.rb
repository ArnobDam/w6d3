class CreateColors < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
      t.string :name

      t.timestamps
    end
    add_column :users, :fave_color_id, :bigint
    add_foreign_key :users, :colors, column: :fave_color_id
  end
end
