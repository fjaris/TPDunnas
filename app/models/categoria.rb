class Categoria < ApplicationRecord
  validates :nome, uniqueness: true
  has_many :produtos
end
