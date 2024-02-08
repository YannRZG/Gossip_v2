
# The Gossip Project 

This is the database part for the application.

In the future, it's gonna be a cool and superDesigned Website wehre all students of The Hacking Project could publish some gossip about other students.

Like, comment and Login system in coming.


## Usage/Examples

```
- 1 : Bundle install
- 2 : Check the Seed if all is ok for you, you can create more thing
- 3 : console -> rails :seed
- 4 : console -> rails console
- 5 : do some research
```


## Contain

This app contain data of User, comment, like, gossip and tag.

#The seeds.rb :
```
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
    description: Faker::Lorem.word,
    email: Faker::Internet.email,
    age: rand(18..75),
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
  all_comments << Comment.create(content: Faker::Lorem.sentence(word_count: 2), user: all_users.sample, gossip: all_gossips.sample)
end

20.times do
  random = rand(1..2)
  if random == 1
    all_likes_comment << LikeComment.create(user: all_users.sample, comment: all_comments.sample)
  else
    all_likes_gossip << LikeGossip.create(user: all_users.sample, gossip: all_gossips.sample)
  end
end

```
## 🚀 About Me
I'm a future fullstack dev. 
This is the beginning of a great coder!

