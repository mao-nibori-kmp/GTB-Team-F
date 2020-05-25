class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :nickname
      t.integer :sex
      t.integer :age
      t.integer :deposit
      t.string :password_digest

      t.timestamps
    end
  end
end
