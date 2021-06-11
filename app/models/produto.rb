class Produto < ApplicationRecord
  mount_uploader :foto, FotoUploader
  
  validates :nome, :preco, presence: true
  belongs_to :categoria

end
