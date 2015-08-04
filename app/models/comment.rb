class Comment < ActiveRecord::Base

	has_many :post_comments, dependent: :destroy
	has_many :comments, through: :post_comments
	belongs_to :user_comments, dependent: :destroy
	belongs_to :user, through: :user_comments

	
	validates_presence_of :username, :title, :body
	validates :title, :body
	
end
