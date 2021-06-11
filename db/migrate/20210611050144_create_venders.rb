class CreateVenders < ActiveRecord::Migration[6.1]
  def change
    create_table :venders do |t|
      t.references :produto, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
