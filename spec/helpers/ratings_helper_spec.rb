require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RatingsHelper. For example:
#
# describe RatingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RatingsHelper, type: :helper do
  describe "ratings_to_buttons" do
    it "turns ratings into HTMl buttons" do
      r = Rating.create!(severity: "R")
      expected_html = '<a class="btn btn-info" href="/ratings/1">R</a>'

      expect(ratings_to_buttons([r])).to eq expected_html
    end
  end
end
