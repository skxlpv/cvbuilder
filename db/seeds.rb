# Users
User.create(
    email: 'admin@gmail.com', first_name: 'admin', surname: 'admin', 
    password: '12345', password_confirmation: '12345', admin: true, age: 20
)

# Languages
Language.language_names.each do |language, value|
    Language.levels.each do |level, value|
        Language.create(name: language, level: level)
    end
end

# Technologies
Technology.create(
    name: "Ruby", description: "", 
    tech_type: "programming_language",
)
Technology.create(
    name: "Django", description: "", 
    tech_type: "framework",
)
Technology.create(
    name: "Ruby on RAILS", description: "", 
    tech_type: "framework",
)
Technology.create(
    name: "PostgreSQL", description: "", 
    tech_type: "database",
)
Technology.create(
    name: "Git", description: "", 
    tech_type: "other",
)
Technology.create(
    name: "Docker", description: "", 
    tech_type: "other",
)
Technology.create(
    name: "Sidekiq", description: "", 
    tech_type: "other",
)