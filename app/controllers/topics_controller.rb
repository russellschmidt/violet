class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_admin, only: [:new, :create, :destroy]
  before_action :authorize_mod, only: [:edit, :update]


  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic was saved"
      redirect_to @topic
    else
      flash[:error] = "There was an error creating the topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Post was updated"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving your update. Try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash[:error] = "There was an error deleting the topic"
      render :show
    end
  end


  private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def authorize_admin
    unless current_user.admin?
      flash[:error] = "You must be an admin to do that"
      redirect_to topics_path
    end
  end

  def authorize_mod
    unless current_user.admin? || current_user.moderator?
      flash[:error] = "You must be a moderator or admin to do that"
      redirect_to topics_path
    end
  end

end
