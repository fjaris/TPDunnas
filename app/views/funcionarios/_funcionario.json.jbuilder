json.extract! funcionario, :id, :nome, :email, :password, :password_confirmation, :created_at, :updated_at, :papel
json.url funcionario_url(funcionario, format: :json)
