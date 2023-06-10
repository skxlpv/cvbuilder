User.create(
    email: 'admin@gmail.com', first_name: 'admin', surname: 'admin', 
    password: '12345', password_confirmation: '12345', admin: true, age: 20
)

Language.language_names.each do |language, value|
    Language.levels.each do |level, value|
        Language.create(name: language, level: level)
    end
end