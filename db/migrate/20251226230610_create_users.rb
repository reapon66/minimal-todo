class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :nome, null: false
      t.string :user_name, null: false
      t.text   :senha, null: false

      t.timestamps
    end

    add_index :users, :user_name, unique: true
  end
end
