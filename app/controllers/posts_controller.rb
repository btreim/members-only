class PostsController < ApplicationController

	before_action :logged_in_user, only: [:new, :create]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.author = current_user.email
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end	
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to posts_url
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "You must be logged in to create a post"
			redirect_to root_url
		end
	end

end
