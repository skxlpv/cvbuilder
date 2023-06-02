class Project < ApplicationRecord
  has_many :technologies
  has_many :workers
end
