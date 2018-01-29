class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @post = @comment.post
  end

  def update
    if @comment.update(comment_params)
      redirect_to posts_path, notice: 'コメントを更新しました'
    end
  end

  def destroy
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'コメントを削除しました。' }
      format.js { render :index }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end

    def set_comment
     @comment = Comment.find(params[:id])
    end

end
