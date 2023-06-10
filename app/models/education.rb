class Education < ApplicationRecord
    has_and_belongs_to_many :workers

    enum degrees: {
        Bachelor: 0,
        Master: 1,
        Doctor: 2,
        Professional: 3
    }

    validates :location, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    def self.enum_options
        degrees.map { |key, _value| [key.humanize, key] }
    end
end
