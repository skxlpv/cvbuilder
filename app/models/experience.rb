class Experience < ApplicationRecord
    has_and_belongs_to_many :workers

    validates :project_description, presence: true
end
