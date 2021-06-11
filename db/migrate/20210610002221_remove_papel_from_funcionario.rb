class RemovePapelFromFuncionario < ActiveRecord::Migration[6.1]
  def change
    remove_column :funcionarios, :papel
  end
end
