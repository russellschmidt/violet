require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do

  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:rating) { Rating.create!(severity: :PG) }

  it { should have_many :ratingalings }
  it { should have_many(:topics).through(:ratingalings) }
  it { should have_many(:posts).through(:ratingalings) }

  describe "ratingalings" do
    it "allows the same rating to be associated with a different topic and post" do
      topic.rating = rating
      post.rating = rating

      topic_rating = topic.rating
      post_rating = post.rating
      expect(topic_rating).to eql(post_rating)
    end
  end

  describe ".update_rating" do
    it "takes a string and returns rating" do
      r = rating.severity
      expect(Rating.update_rating(r)).to eq(rating)
    end
  end

end
