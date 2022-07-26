class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :manager_user, only: [:edit, :update, :destroy]
  #before_action :admin_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @runs = @user.runs.paginate(page: params[:page])
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome! Let's start jogging!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    #User.find(params[:id]).destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.now[:success] = "User deleted"
    respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end
  end

  def report
    if logged_in?
      @user =User.find(params[:id])
      @results = @user.report
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end

    # Before filters
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.manager? || current_user.admin?
    end

    # Confirms a manager user.
    def manager_user
      redirect_to(root_url) unless current_user.manager? || current_user.admin?
    end


  
end
