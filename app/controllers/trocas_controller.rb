class TrocasController < ApplicationController
  before_action :set_troca, only: %i[ show edit update destroy ]

  # GET /trocas or /trocas.json
  def index
    @trocas = Troca.all
  end

  # GET /trocas/1 or /trocas/1.json
  def show
  end

  # GET /trocas/new
  def new
    @troca = Troca.new
    @produtos = Produto.all
    @clientes = Cliente.all
  end

  # GET /trocas/1/edit
  def edit
    @produtos = Produto.all
    @clientes = Cliente.all
  end

  # POST /trocas or /trocas.json
  def create
    @troca = Troca.new(troca_params)

    respond_to do |format|
      if @troca.save
        format.html { redirect_to @troca, notice: "Troca was successfully created." }
        format.json { render :show, status: :created, location: @troca }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @troca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trocas/1 or /trocas/1.json
  def update
    respond_to do |format|
      if @troca.update(troca_params)
        format.html { redirect_to @troca, notice: "Troca was successfully updated." }
        format.json { render :show, status: :ok, location: @troca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @troca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trocas/1 or /trocas/1.json
  def destroy
    @troca.destroy
    respond_to do |format|
      format.html { redirect_to trocas_url, notice: "Troca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_troca
      @troca = Troca.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def troca_params
      params.require(:troca).permit(:produto_id, :cliente_id, :status)
    end
end
