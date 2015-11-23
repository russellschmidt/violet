class Rating < ActiveRecord::Base
  has_many :ratingalings
  belongs_to :ratingable, polymorphic: true

  has_many :topics, through: :ratingalings, source: :ratingable, source_type: :Topic
  has_many :posts, through: :ratingalings, source: :ratingable, source_type: :Post

  before_save { self.severity ||= :PG }

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    r = :PG
    case rating_string
    when "0"
      r = :PG
    when "1"
      r = :PG13
    when "2"
      r = :R
    else
      r = Rating.none
    end

    Rating.find_or_create_by(severity: r)

  end
end
