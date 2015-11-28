class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
                name: params[:user][:name],
                email: params[:user][:email],
                password: params[:user][:password],
                password_confirmation: params[:user][:password_confirmation]
    )

    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end
end
