class RemoveSaldoFromCliente < ActiveRecord::Migration[6.1]
  def change
    remove_column :clientes, :saldo
  end
end
