class CreateTarefas < ActiveRecord::Migration[8.1]
  def change
    create_table :tarefas do |t|
      t.string  :titulo, limit: 128, null: false
      t.text    :descricao, null: false
      t.boolean :status, default: false, null: false

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
