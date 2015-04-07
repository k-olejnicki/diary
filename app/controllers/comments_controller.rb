class CommentsController < ApplicationController
    def create
        @comment = Comment.new params[:comment].permit(:entry_id, :contents, :nick)
        
        if @comment.save
          flash[:notice] = "Added comment"
        else
          flash[:alert]  = "Couldn't create comment: #{@comment.errors.full_messages.to_sentence}" 
        end
        
        redirect_to entry_path(@comment.entry)
    end
end