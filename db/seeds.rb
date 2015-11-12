include RandomData

Post.find_or_create_by(
  title: "Now this is podracing!",
  body: "Man oh man do I love racing my pod during podracing"
)

# Create posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Comment.find_or_create_by(
  post: posts.first,
  body: "Gee whiz I love pod racing too"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
