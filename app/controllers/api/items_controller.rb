class Api::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :require_login
  
  def index
    @items = Item.all.includes(:user)
    render json: @items
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      render json: @item
    else
      render json: @item.errors, status: :bad_request
    end
  end

  def show
    
    render json: @item
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :bad_request
    end
  end

  def destroy
    @item.destroy
    render json: @item
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :purchase_date, :price, :description, :user_id)
  end
end
