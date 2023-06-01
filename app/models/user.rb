class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :password_digest, presence: true, length: { minimum: 8 }
end
