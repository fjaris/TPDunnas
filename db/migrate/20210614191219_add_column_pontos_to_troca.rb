class AddColumnPontosToTroca < ActiveRecord::Migration[6.1]
  def change
    add_column :trocas, :pontos, :decimal
  end
end
