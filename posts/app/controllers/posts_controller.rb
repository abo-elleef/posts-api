class PostsController < ApplicationController

  before_action :find_post, only: %i[show destroy]
  before_action :post_params, only: %i[show destroy]
  before_action :create_post_params, only: %i[create]

  def all
    posts = Post.all
    render json: posts
  end

  def create
    data = create_post_params
    data[:user_id] = User.first.id
    post = Post.create!(data)
    render json: post
  end

  def show
    render json: @post
  end

  def destroy
    @post.destroy
    render head: :ok
  end

  private

    def find_post
      @post = Post.find_by(id: post_params[:id])
    end

    def post_params
      params.permit([:id])
    end

    def create_post_params
      params.require(:post).permit([:text, :user_id, :nature])
    end
end
