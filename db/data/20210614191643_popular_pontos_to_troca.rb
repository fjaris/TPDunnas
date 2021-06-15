class PopularPontosToTroca < SeedMigration::Migration
  def up
    Troca.all.each do |t|
      t.update(pontos: t.produto.preco)
    end
  end

  def down

  end
end
