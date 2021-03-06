class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:edit, :update, :destroy]
  before_action :sold_out, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
    redirect_to root_path if @items == Item.all
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :prefectures_id,
                                 :shipment_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end
end
