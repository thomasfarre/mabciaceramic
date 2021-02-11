class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query"
      @items = Item.where(sql_query, query: "%#{params[:query]}%")
    else
      if(params.key?(:category))
        @items = Item.where(category: params[:category]).order("created_at desc")
      else
        @items = Item.all.order("created_at desc")
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
