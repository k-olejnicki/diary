class CommentsController < ApplicationController
    def index
  		@comments = Comment.all
	 end
	 def show
  		@comment = Comment.find(params["id"])
	 end
    def create
        @comment = Comment.new params[:comment].permit(:entry_id, :contents, :nick)
        
        if @comment.save
          flash[:notice] = "Added comment"
        else
          flash[:alert]  = "Couldn't create comment: #{@comment.errors.full_messages.to_sentence}" 
        end
        
        redirect_to entry_path(@comment.entry)
    end
    def destroy
	 	@comment = Comment.find(params["id"])
	 	@comment.destroy
	 	redirect_to comments_url notice: "Comment was succesfully destroyed"
	 end	
end