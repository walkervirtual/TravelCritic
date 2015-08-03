class PostsController < ApplicationController
	def index
		@posts = Post.all
		@posts = Post.all.order(id: :desc).limit(10)
	end

	def show
		@post = Post.find(params[:id])
	end

	def new 
		@post = User.new
	end

	def create
		@post = Post.new(user_params)
	    if @post.save
	      	redirect_to @post, notice: 'Post was successfully created.'
	    else
	      	render :new
	    end
	end

	#def edit
		#@post = Post.find params[:id]
	#end

	#def update
		#@post = Post.find(params[:id])
    	 #@post.update (post_params)
    	#flash[:alert] = "Just updated #{@user.fname}"
    	#redirect_to users_path(@post)
	#end

	def destroy
    	@post = Post.find params[:id]
    	@post.destroy!
    	session.clear
    	flash[:notice] = "Bye."
    	redirect_to posts_path
  end

    private

    	def post_params
    		params.require(:post).permit(:title,:body)
  		end
end
