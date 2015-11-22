class Rating < ActiveRecord::Base
  has_many :ratingalings
  has_many :topics, through: :ratingalings, source: :ratingable, source_type: :Topic
  has_many :posts, through: :ratingalings, source: :ratingable, source_type: :Post

  before_save { self.severity ||= :PG }

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    return Rating.none if rating_string.blank?

    case rating_string
    when "PG"
      :PG
    when "PG13"
      :PG13
    when "R"
      :R
    else
      return Rating.none
    end 
  end
end
