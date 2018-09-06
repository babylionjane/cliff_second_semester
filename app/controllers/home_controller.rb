class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.save
    
    redirect_to '/home/index'
  end
  
  def destroy
    post = Post.find(params[:post_id])
    post.destroy
    
    redirect_to '/home/index'
  end
  
  def show
    @posts = Post.find(params[:post_id])
  end
  
  def commentcreate
    comment = Comment.new
    comment.post_id = params[:post_id_for_you]
    comment.content = params[:content]
    comment.save
    
    redirect_to :back
  end
end
