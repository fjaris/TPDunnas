class Api::ClientesController < ApiController
  before_action :set_cliente, only: [:update, :update_password]

  # GET /clientes/token
  def token
    if current_cliente
      render json: current_cliente, methods: [:saldo, :saldo_disponivel]
    else
      render json: nil, status: :unauthorized
    end
  end

  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      render json: @cliente, status: :ok
    else
      render json: @cliente.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update_password
    if @cliente.update_with_password(password_params)
      render json: @cliente, status: :ok
    else
      render json: @cliente.errors.full_messages, status: :unprocessable_entity
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cliente_params
    if params[:cliente]
      params.require(:cliente).permit(
        :nome, 
        :email, 
        :usuario
      )
    end
  end

  def password_params
    if params[:cliente]
      params.require(:cliente).permit(
          :current_password,
          :password,
          :password_confirmation
      )
    end
  end

end
