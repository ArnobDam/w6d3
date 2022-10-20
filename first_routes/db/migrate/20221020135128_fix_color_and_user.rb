class FixColorAndUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :colors, :name, false
    add_index :users, :fave_color_id
  end
end
