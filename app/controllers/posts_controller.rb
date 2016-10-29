class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:creat]
  before_action :find_group
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @post = @group.posts.find(params[:id])
  end

  def update
    @post = @group.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to group_path,notice:"Update Success"
    else
      render :edit
    end
  end

  def destroy
    @post = @group.posts.find(params[:id])
    @post.destroy
    redirect_to group_path(@group), alert: "Post deleted"
  end


  private
  def find_group
    @group = Group.find(params[:group_id])
  end
  def post_params
    params.require(:post).permit(:title,:content)
  end

end
