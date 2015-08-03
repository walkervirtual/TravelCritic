class CommentsController < ApplicationController
	def index
		@comments = Comment.all
		@comments = Comment.all.order(id: :desc).limit(10)
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new 
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(user_params)
	    if @comment.save
	      	redirect_to @comment, notice: 'Post was successfully created.'
	    else
	      	render :new
	    end
	end

	#def edit
		#@comment = Comment.find params[:id]
	#end

	#def update
		#@comment = Comment.find(params[:id])
    	# @comment.update (post_params)
    	#flash[:alert] = "Just updated #{@user.fname}"
    	#redirect_to users_path(@post)
	#end

	def destroy
    	@card = Comment.find params[:id]
    	@comment.destroy!
    	session.clear
    	flash[:notice] = "Bye."
    	redirect_to posts_path
  end

    private

    	def post_params
    		params.require(:post).permit(:title,:body)
  		end
end
