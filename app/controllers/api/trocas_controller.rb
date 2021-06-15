class Api::TrocasController < ApiController
  before_action :set_troca, only: %i[ cancelar ]

  def index
    render json: Troca.current_cliente, status: :ok
  end

  def cancelar 
    if @troca.update(status: :cancelado)
      render json: @troca, status: :ok
    else
      render json: @troca.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  
  def create
    @troca = Troca.new(troca_params)
    @troca.cliente = Cliente.current
    if @troca.save
      render json: @troca, status: :created
    else
      render json: @troca.errors.full_messages, status: :unprocessable_entity
    end
  end
        
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_troca
      @troca = Troca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def troca_params
      if params[:troca]
        params.require(:troca).permit(
          :produto_id 
        )
      end
    end
end