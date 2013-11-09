
class PostsController < ApplicationController
http_basic_authenticate_with name: "Gaby", password: "xP629!", except: [:show]

def index
	@posts = Post.all
end
def new
	@post = Post.new
end
def create
  @post = Post.new(params[:post].permit(:title, :text, :price, :photo))
 
  @post.save
  redirect_to @post
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:title, :text, :price, :photo))
    redirect_to @post
  else
    render 'edit'
  end
end

def show
  @post = Post.find(params[:id])
end
 
def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end
 
private
  def post_params
    params.require(:post).permit(:title, :text, :price)
  end
end
