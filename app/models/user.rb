class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :password_digest, presence: true, length: { minimum: 8 }
    validates :age, numericality: { greater_than_or_equal_to: 18 }
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable
end
