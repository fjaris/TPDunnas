json.extract! cliente, :id, :nome, :email, :usuario, :password, :password_confirmation, :saldo, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
