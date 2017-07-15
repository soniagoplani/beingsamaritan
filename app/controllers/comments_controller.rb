class CommentsController < ApplicationController
before_action :set_post , only: [:new,:destroy, :create]

def new

  @post=ProblemPost.find(params[:problem_post_id])
  @comment=Comment.new
end
   
def create
   @comment=Comment.new(comment_params)
   @comment.post_id = params[:problem_post_id] 
  
   respond_to do |format|
     
      if @comment.save
        format.html { redirect_to (@comment.post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
end
end
  def destroy
  @post = ProblemPost.find(params[:problem_post_id])
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to problem_post_path(@post)
 end
private
def set_post
      @post = ProblemPost.find(params[:problem_post_id])
end

def comment_params
        params.require(:comment).permit(:post_id,:body,:name)
end
end
