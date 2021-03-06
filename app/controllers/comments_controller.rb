class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@item)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
