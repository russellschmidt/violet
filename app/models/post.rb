class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  default_scope {order('created_at DESC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
    # implied self.votes >> collects the votes with value 1 into a collection and then counts them
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
    # #sum is a built in ActiveRecord method. We are calling sum on the value attribute
  end

end
