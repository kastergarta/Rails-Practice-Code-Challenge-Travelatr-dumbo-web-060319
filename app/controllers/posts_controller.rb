class PostsController < ApplicationController
  before_action :get_post, only: [:show]

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def show
      @posts = Destination.posts
    end

    def create
      @post = Post.new(post_params)
      @blogger = Blogger.find(@post.blogger_id)
      if @post.save
        redirect_to @post
      else
        render :new
    end
  end
#UPDATE
    def update
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end

    private

        def post_params
          params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
        end


        def get_post
          @post = Post.find(params[:id])
        end
end
