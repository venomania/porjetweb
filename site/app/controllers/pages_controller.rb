class PagesController < ApplicationController
    def article
        @Post = Post.all
    end
end