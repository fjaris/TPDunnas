class Troca < ApplicationRecord
  belongs_to :produto, optional: true
  belongs_to :cliente, optional: true

  validates :cliente_id, :produto_id, presence: true
  scope :current_cliente, -> { where(cliente_id: Cliente.current.id) }

  enum status: [:solicitado, :confirmado, :negado, :finalizado, :cancelado]

  before_save do
    self.pontos = self.produto.preco
  end

  before_validation :validate_saldo_on_create, on: [:create]

  before_validation :validate_saldo_on_update, on: [:update]

  before_validation :check_cancelado

  
   
  private
    def validate_saldo_on_create
      self.errors.add(:base, "Saldo insuficiente.") if self.cliente && (self.cliente.saldo_disponivel < self.produto.preco)
    end

    def validate_saldo_on_update
      self.errors.add(:base, "Saldo insuficiente.") if self.cliente && ((self.cliente.saldo_disponivel + Produto.find(self.produto_id_was).preco) < self.produto.preco)
    end

    def check_cancelado
      self.errors.add(:status, "A troca só pode ser cancelada caso o status seja solicitado") if self.cancelado? && self.status_was != "solicitado"
    end

end

