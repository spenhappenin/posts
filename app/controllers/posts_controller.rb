class PostsController < ApplicationController

	# showing all the posts
	# looks for the index.html.erb template
  def index
  	# this is going to get all posts
  	@posts = Post.all
  end

# showing a specific or a single post
# looks for the show.html.erb template
  def show
  	# Is going to get a single post by ID
  	@post = Post.find(params[:id])
  end

# creates a new instance in memory
# shows an empty form so the user can create a new post
  def new
  	# responsible for creating a new instence of a post
  	@post = Post.new
  end

# runs the sql query to add a new post to our database
# redirects or renders depending on the outcome
# there is NO view associated with this method!
  def create 
  	# saving the post with the form values into the database
  	@post = Post.new(post_params)
  	if @post.save
  		# a successful new record in the database
  		redirect_to post_path(@post)
  	else
  		# unsuccessful create
  		 render :new
  	end
  end

# finds a single post in the database
# looks for the edit.html.erb template and renders it
  def edit
  	@post = Post.find(params[:id])
  end

# responsible for finding a post in the database
# trying to update that post with the given params
# redirects or renders depending on the outcome
# this method has NO view associated with it!
  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		# successful update in database
  		redirect_to post_path(@post)
  	else
  		# unsuccessful database update
  		render :edit
  	end
  end

  # finds a single post in the database
  # removes that record
  # redirects to the index method
  # this method has NO view associated with it!
  def destroy 
  	@post = Post.find(params[:id])
  	@post.destroy 
  	redirect_to posts_path
  end

  private
  # strong params
  	def post_params
  		params.require(:post).permit(:title, :body, :author, :public)
  	end

end









