# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.transaction do
  250.times do |i|
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker:: Name.last_name,
      username: "#{Faker::Name.first_name.downcase}_#{i+10}",
      email: Faker::Internet.email,
      contact_number: Faker::PhoneNumber.phone_number_with_country_code,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      province: Faker::Address.state,
      country: Faker::Address.country,
      postal_code: Faker::Address.postcode,
      date_of_birth: (Date.today + rand(1..30).days) - rand(22...45).years,
      profile_title: User::PROFILE_TITLE.sample,
      password: 'password',
      about_me: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    )
    puts "user #{user.id} created successfully"
  end
end
