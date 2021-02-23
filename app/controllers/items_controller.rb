class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :disable_nav, :disable_footer, only: [:show]
  ITEMS_PER_PAGE = 6

  def show
  end

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query"
      @items = Item.where(sql_query, query: "%#{params[:query]}%")
    else
      @page = params.fetch(:page, 0).to_i
      @items = Item.offset(@page * ITEMS_PER_PAGE).limit(ITEMS_PER_PAGE)
    end
  end

  private

  def disable_nav
    @disable_nav = true
  end

  def disable_footer
    @disable_footer = true
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
