class PostsController < ApplicationController
	
  before_action :find_a_nerd, only: [:edit, :destroy, :update, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.get_all_recent_nerds	
	end

  def show
    @post
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(strong_params)

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    if owned(@post)
      @post
    else
      redirect_to root_path
    end
  end

  def update
    if @post.update(strong_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if owned(@post)
      @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private    
    def strong_params
      params.require(:post).permit(:name, :description, :rating, :nerd)
    end

    def find_a_nerd
      @post=Post.find(params[:id])
    end

    def owned(post)
      current_user.id == post.user_id
    end
end
