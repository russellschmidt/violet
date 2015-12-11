require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_user) {create(:user)}
  let(:my_topic) {create(:topic)}
  let(:my_post) {create(:post, user: my_user, topic: my_topic)}

  before do
    @new_post = build(:post)
  end

  context "unauthenticated users" do
    describe "json endpoint for PUT update" do
      before { put :update, id: my_post.id, post: {title: @new_post.title, body: @new_post.body}}

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "updates a post with the correct attributes" do
        updated_post = Post.find(my_post.id)
        expect(updated_post.to_json).to eq response.body
      end
    end

    describe "json endpoint for DELETE destroy" do
      before { delete :destroy, id: my_post.id}
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "returns the correct json success message" do
        expect(response.body).to eq({"message" => "Post destroyed","status" => 200}.to_json)
      end

      it "deletes the post my_post" do
        expect{Post.find(my_post.id)}.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end

    describe "POST create for json" do
      it "POST create returns http unauthenticated" do
        post :create, post: {title: "New Post Name", body: "Anonymous post body we will reject"}
        expect(response).to have_http_status(401)
      end
    end
  end

  context "authenticated users" do

    describe "POST create" do

      before do
        controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
        @new_post = build(:post, user_id: my_user.id, topic_id: my_topic.id)
        post :create, post: { title: @new_post.title, body: @new_post.body, topic_id: my_topic.id, user_id: my_user.id }

      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a post with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(@new_post.title).to eq hashed_json["title"]
        expect(@new_post.body).to eq hashed_json["body"]
      end
    end
  end
end
