class PostsController < ApplicationController
    def index
        @Post = Post.all
    end
    def show
        @post = Post.find(params[:id])
        
    end
end