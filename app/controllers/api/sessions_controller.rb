class Api::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  
  respond_to :json

  private
    def respond_with(resource, _opts = {})
      render json: resource.as_json.merge({accessToken: request.env['warden-jwt_auth.token']})
    end

    def respond_to_on_destroy
      head :no_content
    end
end
