class User < ApplicationRecord
  after_create :create_worker_record
  has_secure_password
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable
  
  validates :email, presence: true
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :age, numericality: { greater_than_or_equal_to: 18 }

  private

  def create_worker_record
    Worker.create(user: @user)
  end
end