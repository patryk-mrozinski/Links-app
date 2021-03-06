class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commet, except: [:create]

  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)
    if @comment.save
      make_child_comment(@comment)
      flash[:success] = "Comment was created successfuly"
      redirect_to root_path
    else
      @links = Link.all
      @link = Link.new
      @new_comment = Comment.new(user: current_user)
      render 'links/index', danger: "Sorry"
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  def like
    @comment.upvote_by current_user
    redirect_to root_path
  end

  def dislike
    @comment.downvote_from current_user
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id, :comment_id)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

   def commentable_id
     comment_params[:commentable_id]
   end

   def comment_id
     comment_params[:comment_id]
   end

   def body
     comment_params[:body]
   end

   def make_child_comment(comment)
     return "" if comment_id.blank?

     parent_comment = Comment.find comment_id
     comment.move_to_child_of(parent_comment)
   end

   def set_commet
     @comment = Comment.find(params[:id])
   end

end
