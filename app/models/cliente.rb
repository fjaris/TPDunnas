class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  has_many :pontos
  has_many :trocas

  validates :email, presence: true
  validates :usuario, uniqueness: true
  validates :email, uniqueness: true
  validates :password, presence: true, :length => { :minimum => 6}, :on => :addCliente

  
  def saldo
    self.pontos.sum(:pontos) - self.trocas.where(status: :finalizado).sum(:pontos)
  end

  def saldo_disponivel
    self.pontos.sum(:pontos) - self.trocas.where(status: [:finalizado, :solicitado, :confirmado]).sum(:pontos)
  end

  private
    def self.current=(cliente)
      Thread.current[:current_cliente] = cliente
    end

    def self.current
      Thread.current[:current_cliente]
    end
end
