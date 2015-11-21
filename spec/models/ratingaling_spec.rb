require 'rails_helper'

RSpec.describe Ratingaling, type: :model do
  it {should belong_to :ratingable}
end
