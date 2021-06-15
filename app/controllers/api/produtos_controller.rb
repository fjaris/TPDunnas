class Api::ProdutosController < ApiController
    def index
        render json: Produto.search(params), status: :ok
    end
end