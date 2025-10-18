# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
    @comment = @note.comments.build(comment_params)
    if @comment.save
      redirect_to note_path(@note), notice: "コメントを追加しました"
    else
      redirect_to note_path(@note), alert: "コメントを入力してください"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end