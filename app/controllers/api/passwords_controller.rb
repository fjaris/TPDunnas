class Api::PasswordsController < Devise::PasswordsController
  protect_from_forgery with: :null_session
  
  respond_to :json 
end
