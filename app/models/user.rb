class User < ApplicationRecord
    has_secure_password
    
    validates :cpf, presence: true
    validates :email, presence: true
    has_many :movement_types, dependent: :delete_all
    has_many :earnings, dependent: :delete_all
    has_many :expenses, dependent: :delete_all
end
