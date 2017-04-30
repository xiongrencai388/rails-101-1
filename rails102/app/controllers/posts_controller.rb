class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_paramas)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    elsif
      render :new
    end
  end

  private

  def post_paramas
    params.require(:post).permit(:content)    
  end
end
