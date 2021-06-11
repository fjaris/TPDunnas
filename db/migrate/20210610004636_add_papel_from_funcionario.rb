class AddPapelFromFuncionario < ActiveRecord::Migration[6.1]
  def change
    add_column :funcionarios, :papel, :decimal
  end
end
