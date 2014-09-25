class TracksController < ApplicationController
before_action :is_authenticated?

	def index
    @tracks = Track.all
  end

  def new
		@track =Track.new
	end

  def create
  	@track = Track.new(params.require(:track).permit(:task, :file))
    @track.user_id = current_user.id

  	if @track.save
    		redirect_to user_path(@track.user_id), notice: 'track was successfully created.'
   	else
   		print "errors"
   		p @track.errors
   		print "track was not saved"
     		render action: 'new'
     	end
  end

  # def show
  # 	@track = Track.find_by_id(params[:id])
  #   # @comments = @track.comments
  #   # @comment = @track.comments.new

  # end

  def edit
    user_id = params[:id]
    @track = Track.find_by_id(params[:id])
  end

  def update
    if session[:user_id] == nil
      redirect_to root_path
    else
      @current_user = User.find_by_id(session[:user_id])
    end

    user_id =  params[:id]
    res = params.require(:track).permit(
      :file)

    track = Track.find_by_id(params[:id])

    track.update_attributes( :file => res[:file] )
    redirect_to "/users/#{track.user_id}"
  end

  def destroy

    @track = Track.find(params[:id])
    @track.destroy

    redirect_to @track.user, :notice => "Track was deleted"
  end

  	private

  	def track_params
    	params.require(:track).permit(:task, :file)
  	end
end
