class CommentsController < ApplicationController
  # before_action :find_parent

	def index
		find_track_id
		@comments = @track.comments.all
	end

  def new
  	find_track_id
  	@comments = @track.comments.new
  end

  def create
  	find_track_id
  	new_comment = params.require(:comment).permit(:description)
    @track.comments.create(new_comment)

    redirect_to @track.user
  end

  def show
    user_id = params[:user_id]
    @user = User.find(user_id)
    track_id = params[:id]
    @track = @user.tracks.find(params[:id])
    @comments = @track.comments
    @comment = @track.comments.new
  end

  def destroy
  	find_comment_id
  	@comment.destroy
  	find_track_id
  	redirect_to 'tracks/@track'
  end



  private

  # def find_parent
  #     @parent = @track = Track.find_by_id(params[:track_id])
  #     if params[:id]
  #       @parent = Comment.find_by_id(params[:id])
  #     end
  #     redirect_to user_path unless @parent
  #   end

  def find_track_id
  	track_id = params[:track_id]
  	@track = Track.find(track_id)
  end

  def find_comment_id
  	comment_id = params[:id]
  	@comment = Comment.find(comment_id)
  end


end
