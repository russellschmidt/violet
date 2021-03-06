require 'rails_helper'
include RandomData

RSpec.describe Vote, type: :model do
  #let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  #let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  #let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:topic) {create(:topic)}
  let(:user) {create(:user)}
  let(:post) {create(:post)}

  let(:vote) { Vote.create!(value: 1, post: post, user: user) }

  it { should belong_to(:post) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:value) }
  it { should validate_inclusion_of(:value).in_array([-1, 1]) }
  # check that value is assigned to either -1 or +1

  describe "update_post callback" do
    it "triggers update_post on save" do
      expect(vote).to receive(:update_post).at_least(:once)
      vote.save
    end

    it "#update_post should call update_rank on post" do
      expect(post).to receive(:update_rank).at_least(:once)
      vote.save
    end
  end
end
