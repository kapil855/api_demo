class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_post, only: %i[show]

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    render template: 'api/V1/posts/details', locals: {post: @post}
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end