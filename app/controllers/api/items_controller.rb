class Api::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = Item.all
    render json: @items
  end

  def create
    @item = Item.new(item_params)
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
    params.require(:item).permit(:name, :purchase_date, :price, :description, :category)
  end
end
