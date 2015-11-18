class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session user
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combo'
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = 'You have been signed out. Come back soon, ya hear!'
    redirect_to root_path
  end

end
