class ApiController < ActionController::API
  before_action :authenticate_cliente!

  before_action :set_current_cliente
  after_action :unset_current_cliente

  private
    def set_current_cliente
      Cliente.current = current_cliente
    end
    def unset_current_cliente
      Cliente.current = nil
    end

end