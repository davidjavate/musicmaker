class UsersController < ApplicationController

  before_action :is_authenticated?

  def index
    @users = User.all
    @track = Track.all
     @comment = Comment.new
  end

  def new
    @user = User.new

  end

  def create
    new_user = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :image_url)
    @user = User.create(new_user)

    if @user.valid?
      redirect_to users_path
    else
      @errors = @user.errors.full_messages
      render signup_path
    end


  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def update
    if session[:user_id] == nil
      redirect_to root_path
    else
      @current_user = User.find_by_id(session[:user_id])
    end
    user_id = params[:id]
    res = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :image_url)
    user = User.find_by_id(user_id)

    user.update_attributes(
      :first_name => res[:first_name],
      :last_name  => res[:last_name],
      :email      => res[:email],
      :image_url  => res[:image_url])
    redirect_to "/users/#{user_id}"
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    @tracks = Track.all
    # @track = @user.tracks.find(user_id)
    # @comments = @track.comments.all
    @comment = Comment.new



    #find user for nav bar
    @current_user = current_user


  end

  def destroy

    @user = User.find(params[:id])
    @track = @user.tracks.find(params[:id])
    @track.destroy

    redirect_to user_path, :notice => "Post was deleted"
  end
end