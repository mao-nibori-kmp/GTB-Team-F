class AddGenreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :genre, :text
  end
end
