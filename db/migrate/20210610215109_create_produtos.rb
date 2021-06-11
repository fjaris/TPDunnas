class CreateProdutos < ActiveRecord::Migration[6.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.string :foto
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
