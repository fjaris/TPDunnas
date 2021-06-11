class VendersController < ApplicationController
  before_action :set_vender, only: %i[ show edit update destroy ]

  # GET /venders or /venders.json
  def index
    @venders = Vender.all
  end

  # GET /venders/1 or /venders/1.json
  def show
  end

  # GET /venders/new
  def new
    @vender = Vender.new
    @produtos = Produto.all
    @clientes = Cliente.all
  end

  # GET /venders/1/edit
  def edit
    @produtos = Produto.all
    @clientes = Cliente.all
  end

  # POST /venders or /venders.json
  def create
    @vender = Vender.new(vender_params)

    respond_to do |format|
      if @vender.save
        format.html { redirect_to @vender, notice: "Vender was successfully created." }
        format.json { render :show, status: :created, location: @vender }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venders/1 or /venders/1.json
  def update
    respond_to do |format|
      if @vender.update(vender_params)
        format.html { redirect_to @vender, notice: "Vender was successfully updated." }
        format.json { render :show, status: :ok, location: @vender }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venders/1 or /venders/1.json
  def destroy
    @vender.destroy
    respond_to do |format|
      format.html { redirect_to venders_url, notice: "Vender was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vender
      @vender = Vender.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vender_params
      params.require(:vender).permit(:produto_id, :cliente_id)
    end
end
