class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Registration successful.'
      redirect_to @user
    else
      flash[:notice] = 'Registration failed.'
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
