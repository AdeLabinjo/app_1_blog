class PostsController < ApplicationController
      
  def index 
     @posts = Post.all     
  end 
  
  def new
    @post = Post.new 
  end 
  
  def show 
    @post = Post.find(params[:id])
  end
  
  def edit 
    @post = Post.find(params[:id])
  end 
  
  def  update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      redirect_to :root 
    else 
      render 'edit'
    end 
    
  end 
  
  def create 
   @post = Post.new(post_params)
     
    if @post.save
      redirect_to :root
    else 
      render 'new'
    end 
  end
  
  def destroy 
    @post = Post.find(params[:id])
    @post.destroy 
    
    redirect_to posts_path 
  end 
  
  private 
    def post_params 
      params.require(:post).permit(:title, :text)
    end
 
  
end
