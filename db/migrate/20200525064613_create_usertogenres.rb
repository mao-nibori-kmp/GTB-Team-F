class CreateUsertogenres < ActiveRecord::Migration[6.0]
  def change
    create_table :usertogenres do |t|
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
