include RandomData

#Create Users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

# create specific users for testing the app
admin = User.create!(
  name: 'Rusty',
  email: 'reuvenschmidt@gmail.com',
  password: '12344321',
  role: 'admin'
)

member = User.create!(
  name: 'Steve Sax',
  email: 'russellmschmidt@gmail.com',
  password: '12344321',
  role: 'member'
)


# Create topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create posts
50.times do
  post = Post.create!(
    topic: topics.sample,
    user: users.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
    )
    # simulate times posts created for more realism and to test ranking algorithm
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  # add simulated votes
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph,
    user: users.sample
  )
end

#Create advertisements
25.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: RandomData.random_fixnum
  )
end

#Create questions
33.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: RandomData.random_boolean
  )
end



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{Vote.count} votes created"
