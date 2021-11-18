class PostController < ApplicationController
    include Pagy::Backend
    skip_before_action :verify_authenticity_token, :only => [:create]

    def index

        # @q = Post.ransack(params[:q])
        # @people = @q.result
      

        @pagy, @post = pagy(Post.all)
        # byebug
    end

    def new
    end

    def show 

       @post = Post.find(params[:id])
       @comments = @post.comments

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

        # byebug

        @post=Post.find(params[:id])

        @post.update(params["post"].permit( :post_name ) )
        
        redirect_to action: "index"

    end
    

    def destroy
           current_user
        @post=Post.find(params[:id])

        @post.destroy

        redirect_to action: "index"
    end

   

    private 
    def post_params
        params.permit(:post_name , :user_id ,:image)
    end

end
