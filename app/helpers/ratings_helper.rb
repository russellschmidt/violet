module RatingsHelper
  def ratings_to_buttons(ratings)
    raw ratings.map { |r| link_to r.severity, rating_path(id: r.id), class: 'btn btn-info'}.join(' ')
  end
end
