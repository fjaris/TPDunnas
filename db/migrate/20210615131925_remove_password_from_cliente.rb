class RemovePasswordFromCliente < ActiveRecord::Migration[6.1]
  def change
    remove_column :clientes, :password_digest
    remove_column :clientes, :password_confirmation
  end
end
