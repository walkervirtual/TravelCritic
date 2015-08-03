class UsersController < ApplicationController
	def index
		@users = User.all
		@users = User.all.order(id: :desc).limit(10)
	end

	def show
		@user = User.find(params[:id])
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	    if @user.save
	      	redirect_to @user, notice: 'User was successfully created.'
	    else
	      	render :new
	    end
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find(params[:id])
    	 @user.update_attributes params[:user]
    	flash[:alert] = "Just updated #{@user.fname}"
    	redirect_to users_path(@user)
	end

	def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

    private

    	def user_params
    		params.require(:user).permit(:fname,:lname, :email, :password,:password_confirmation,:username)
  		end
end
