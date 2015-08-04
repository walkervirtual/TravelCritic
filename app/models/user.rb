class User < ActiveRecord::Base
	has_many :user_comments
	has_many :comments, through: :user_comments
	has_many :user_post
	has_many :posts, through: :user_posts

	#has_attached_file :avatar, :style  => {
							   #:medium => '300 x 300',
							   #:thumb => '100 x 100>'},
							#:default_url => "/images/:style/missing.png"
	#validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :password, confirmation: true
	validates_presence_of :username, :password, :email,:fname,:lname
	validates :fname, :lname, :uniqueness =>{:scope =>[:username,:password, :email]}
	# get the right validation
	#validates_format_of :email, :with => (/\d{3}-\d{3}-\d{4}/)

	# see if and works better to prevent DRY

	before_destroy :destroy_authored_comments 
	before_destroy :destroy_authored_posts

	def destroy_authored_comments
	    all_my_comments = self.comments
	    owned_comments = all_my_comments.select do |comment|
	                    comment.user_id == current_user
	                end
	    owned_comments.each &:destroy!
	end

	def destroy_authored_posts
	    all_my_posts = self.posts
	    owned_posts = all_my_posts.select do |post|
	                    post.user_id == current_user
	                end
	    owned_posts.each &:destroy!
	end

	def full_name
	    fname + ' ' + lname
	end
end
