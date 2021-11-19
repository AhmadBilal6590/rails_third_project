class PostController < ApplicationController    
    include Pagy::Backend
    skip_before_action :verify_authenticity_token, :only => [:create]

    def index      
        if(params[:post_name])    

             @post=Post.where("post_name LIKE ?", "%" + params[:post_name] + "%")
        else
            @pagy, @post = pagy(Post.all)
        end  
    end

    def new
    end

    def show 

       @post = Post.find(params[:id])
       @comments = @post.comments

    end

    def create 

        @post=Post.new(post_params)

        if(@post.save)  
            # PostMailer.post_created.deliver_now
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
        params.permit(:post_name , :user_id , :image)
    end

end
