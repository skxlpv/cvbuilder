class Technology < ApplicationRecord
    enum tech_type: {
        programming_language: 0,
        framework: 1,
        database: 2,
        other: 3
    }

    def self.enum_options
        tech_types.map { |key, _value| [key.humanize, key] }
    end
end
