class AddStatustoTroca < ActiveRecord::Migration[6.1]
  def change
    add_column :venders, :status, :integer, default: 0
  end
end
