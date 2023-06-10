class Language < ApplicationRecord
    before_create :populate_language_levels
    has_and_belongs_to_many :workers

    enum language_names: {
        English: 0,
        Ukrainian: 1,
        Polish: 2,
        German: 4,
        French: 5,
        Japanese: 6,
        Hindi: 7
    }

    enum levels: {
        A1: 0,
        A2: 1,
        B1: 2,
        B2: 3,
        C1: 4,
        C2: 5
    }
    def self.enum_levels_options
        levels.map { |key, _value| [key.humanize, key] }
    end

    def self.enum_language_names_options
        language_names.map { |key, _value| [key.humanize, key] }
    end

    private
    def populate_language_levels
        if Language.where(name: self.name).exists?
            raise ActiveRecord::Rollback, "Language already exists in database"
        else
            Language.levels.each do |level, value|
                Language.create(name: self.name, level: level)
            end
        end
    end
      
end
