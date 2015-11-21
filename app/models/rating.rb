class Rating < ActiveRecord::Base
  has_many :ratingalings
  has_many :topics, through: :ratingalings, source: :ratingable, source_type: :Topic
  has_many :posts, through: :ratingalings, source: :ratingable, source_type: :Post

  before_save { self.severity ||= :PG }

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    # code here
  end
end
