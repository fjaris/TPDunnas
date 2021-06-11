class AddPrecoToProduto < ActiveRecord::Migration[6.1]
  def change
    add_column :produtos, :preco, :integer
  end
end
