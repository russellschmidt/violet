require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title:"New Question", body:"Am I a question?", resolved:false)}
  let(:answer) {Answer.create!(body:"I am the answer", question:question)}

  describe "attributes" do
    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
  end
end
