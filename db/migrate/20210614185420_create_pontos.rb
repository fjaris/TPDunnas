class CreatePontos < ActiveRecord::Migration[6.1]
  def change
    create_table :pontos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.decimal :pontos

      t.timestamps
    end
  end
end
