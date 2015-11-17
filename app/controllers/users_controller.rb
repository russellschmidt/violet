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
      redirect_to root_path
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render :new
    end
  end
end
