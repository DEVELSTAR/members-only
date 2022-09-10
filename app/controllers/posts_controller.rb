class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]


	def index
		@posts = Post.all
		@user = User.all
	end

	def new
		@post = Post.new
	end

	def create
		# @post = Post.new(post_params)
	    @post = current_user.posts.build(post_params)


		if @post.save
			redirect_to root_path
		else
			render :new
		end
	end


	private 

	def post_params
		params.require(:post).permit(:title, :description, :user_id, :username)
	end

  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_registration_path # halts request cycle
    end
  end

end
