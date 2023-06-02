class Worker < ApplicationRecord
  belongs_to :user
  has_many :technologies
end
