# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

require 'faker'
Faker::Config.locale='fr'
Faker::UniqueGenerator.clear

City.destroy_all
Comment.destroy_all
GossipTag.destroy_all
Gossip.destroy_all
LikeGossip.destroy_all
LikeComment.destroy_all
PrivateMessage.destroy_all
User.destroy_all
Tag.destroy_all



all_cities = []
all_users = []
all_comments = []
all_gossip_tags = []
all_gossips = []
all_likes_comment = []
all_likes_gossip = []
all_private_messages = []
all_tags = []
all_zip_code = []



all_zip_code = ['75001', '75002', '75003', '75004', '75005', '75006', '75007', '75008', '75009', '75010'];
#CREATION OF 10 CITIES
10.times do
  all_cities << City.create(name: Faker::Address.city, zip_code: all_zip_code.sample)
end

10.times do
  all_users << User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..75),
    description: Faker::Lorem.word,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters[1..rand(8..16)], #mot de passe du user qui sera crypté dans password_digest
    city: all_cities.sample
    )
end

20.times do
  all_gossips << Gossip.create(title: Faker::Lorem.word, content: Faker::Lorem.sentence(word_count: 4), user: all_users.sample)
end

10.times do
  all_tags << Tag.create(title: Faker::Lorem.word)
end 

all_gossips.each do |gossip|
  all_gossip_tags << GossipTag.create(gossip: gossip, tag: all_tags.sample)
end

4.times do
  sender = all_users.sample
  recipient = all_users.reject{|i| i == sender}.sample
  all_private_messages << PrivateMessage.create(content: Faker::Lorem.sentence(word_count: 5), sender: sender, recipient: recipient)
end

20.times do
  # Choisissez aléatoirement un utilisateur et un gossip ou un commentaire existant comme parent
  parent = [all_gossips.sample, all_comments.sample].sample
  # Créez un commentaire en utilisant la relation polymorphique
  all_comments << Comment.create(content: Faker::Lorem.sentence(word_count: 2), user: all_users.sample, commentable: parent)
end

20.times do
  random = rand(1..2)
  if random == 1
    all_likes_comment << LikeComment.create(user: all_users.sample, comment: all_comments.sample)
  else
    all_likes_gossip << LikeGossip.create(user: all_users.sample, gossip: all_gossips.sample)
  end
end

