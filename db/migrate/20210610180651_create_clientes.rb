class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.string :usuario
      t.string :password_digest
      t.string :password_confirmation
      t.decimal :saldo, default: 0

      t.timestamps
    end
  end
end
