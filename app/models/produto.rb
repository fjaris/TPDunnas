class Produto < ApplicationRecord
  mount_uploader :foto, FotoUploader
  
  validates :nome, :preco, presence: true
  belongs_to :categoria

  def self.search(params)
    produtos = joins(:categoria)
    produtos = produtos.where("produtos.nome LIKE ?", "%#{params[:nome]}%") unless params[:nome].blank?
    produtos = produtos.where("produtos.descricao LIKE ?", "%#{params[:descricao]}%") unless params[:descricao].blank?
    produtos = produtos.where("categorias.nome LIKE ?", "%#{params[:categoria]}%") unless params[:categoria].blank?
    return produtos
  end

end
