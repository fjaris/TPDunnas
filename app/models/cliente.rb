class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include ActiveModel::SecurePassword

  validates :nome, :email, :usuario, presence: true
  validates :usuario, uniqueness: true
  validates :email, uniqueness: true
  validates :password, presence: true, :length => { :minimum => 6}, :on => :addCliente

  has_secure_password

end
