class Api::V1::PostsController < Api::V1::BaseController
  before_filter :authenticate_user, only: :create

  def update
    post = Post.find(params[:id])

    if post.update_attributes(post_params)
      render json: post.to_json, status: 200
    else
      render json: {error: "Post update failed", status: 400}, status: 400
    end
  end


  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render json: {message: "Post destroyed", status: 200}, status: 200
    else
      render json: {error: "Post destroy failed", status: 400}, status: 400
    end
  end


  def create
    topic = Topic.find(params[:post][:topic_id])
    post = topic.posts.build(post_params)
    post.user = @current_user

    if post.valid?
      post.save!
      render json: post.to_json, status: 201
    else
      render json: {error: "Post is invalid", status: 401}, status: 401
    end
  end

  #def show
  #  topics = Topic.find(params[:id])
  #  render json: topics.to_json, status: 200
  #end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
