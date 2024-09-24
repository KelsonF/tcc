require "faker"

# Encontre ou crie um usuário (simulando o current_user)
user = User.find_or_create_by!(email: 'kfeduardo2003+tcc@gmail.com') do |user|
  user.password = 'yqkkaW8k7:fB:E-' # ou qualquer senha segura
  user.password_confirmation = 'yqkkaW8k7:fB:E-'
end

# Verifique se o usuário já tem uma loja, ou crie uma
store = user.store || Store.create!(name: "Pet Shop #{user.email}", user: user)

# Lista de produtos para popular o banco de dados
products = [
  { name: "Dog Leash", description: "A sturdy leash for your dog.", price: 15.99, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Cat Tree", description: "A tall cat tree for climbing and scratching.", price: 79.99, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Bird Cage", description: "A spacious cage for small birds.", price: 120.00, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Fish Tank", description: "A 20-gallon fish tank with all accessories.", price: 150.50, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Hamster Wheel", description: "A durable wheel for small rodents.", price: 10.49, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Rabbit Hutch", description: "A cozy outdoor hutch for rabbits.", price: 220.00, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Pet Shampoo", description: "Organic shampoo for dogs and cats.", price: 8.99, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Dog Bed", description: "A large, comfortable bed for dogs.", price: 45.00, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Cat Litter Box", description: "An easy-to-clean litter box for cats.", price: 25.75, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) },
  { name: "Pet Carrier", description: "A durable pet carrier for travel.", price: 35.99, image_url: Faker::LoremFlickr.image(search_terms: [ 'animals' ]) }
]

# Criar os produtos e associar à loja do usuário
products.each do |product_attributes|
  store.products.create!(product_attributes)
end

puts "Seeded #{products.size} products for store #{store.name} owned by #{user.email}!"
