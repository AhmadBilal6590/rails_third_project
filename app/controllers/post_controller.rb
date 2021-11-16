class PostController < ApplicationController

    skip_before_action :verify_authenticity_token, :only => [:create]

    def index
        @post=Post.all
        # byebug
    end

    def new
    end

    def create 

        # byebug
        @post=Post.new(post_params)

        if(@post.save)  
            redirect_to action: "index"
        else
        render 'new'
        end

    end

    def edit  

        @post=Post.find(params[:id])

    end

    def update
        

    end
    

    def destroy
        @post=Post.find(params[:id])

        @post.destroy

        redirect_to action: "index"
    end

   

    private 
    def post_params
        params.permit(:post_name)
    end

end
