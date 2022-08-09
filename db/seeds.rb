# Create a main sample user.
User.create!(name: "Example User",
            email: "example@railstutorial.org",
            password: "foobar",
            password_confirmation: "foobar",
            manager: true)

User.create!(name: "Beluga",
            email: "marincapaul@outlook.com",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true)
            
# Generate a bunch of additional users.
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)
end


# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
    distance = rand(1...10)
    time = rand(10..40)
    users.each { |user| user.runs.create!(distance: distance, time: time) }
end
