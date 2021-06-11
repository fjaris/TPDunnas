class ChangeDecimalToInteger < ActiveRecord::Migration[6.1]
  def up
    change_column :clientes, :saldo, :integer
  end
  def down
    change_column :clientes, :saldo, :decimal
  end
end
