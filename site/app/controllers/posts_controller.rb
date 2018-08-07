class PostsController < ApplicationController
    def index
        @Gener = Gener.all
    end
    def show
        @Gener = Gener.find(params[:id])
        @Article = Article.where(id_gener: Gener.find(params[:id]))
    end
end