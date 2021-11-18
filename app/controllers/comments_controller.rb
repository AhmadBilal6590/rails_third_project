class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @comments=Comment.all
    end

    def create
        # byebug
        @comment=Comment.new(params.permit(:comment_text , :post_id , :user_id))

        @comment.save
        # post = Post.find(params[:post_id])

        respond_to do |format|
            if @comment.present?

                format.js { redirect_to action: :show, controller: :post, id: params[:post_id] }

            end
        end

    end
end
