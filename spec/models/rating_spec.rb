require 'rails_helper'

RSpec.describe Rating, type: :model do

  it { should have_many :ratingalings }
  it { should have_many(:topics).through(ratingalings) }
  it { should have_many(:posts).through(ratingalings)
   }
end
