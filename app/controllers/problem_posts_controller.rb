class ProblemPostsController < ApplicationController
layout "problem_post" 


def show
@post = ProblemPost.find(params[:id])
@comment = Comment.new( :post => @post )
@comments = @post.comments
    
end
def index
  @post = ProblemPost.page(params[:page]).per(10)
  
end 
def new

  @category=ProblemCategory.find(params[:problem_category_id])
  @post=ProblemPost.new
    

end
def create 
     @category=ProblemCategory.find(params[:problem_category_id])
   @post=ProblemPost.new(post_params)
   @post.category_id = params[:problem_category_id] 
  
   respond_to do |format|
     
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
end
def show_comment_form
   render :partial=>"problem_posts/comment"
end
private
def post_params
  params.require(:problem_post).permit(:title,:category_name,:category_id,:content ,:name)
end
end

