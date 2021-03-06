class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :disable_nav, only: [:show]
  # ITEMS_PER_PAGE = 6

  def show
  end

  # possibility to sorting in back with query but for now its not implemented, doing sorting in front with JS
  def index
    # @categories = Item::CATEGORY
    @categories = Item.used_category

    # if params[:query].present?
    #   sql_query = "title ILIKE :query OR category ILIKE :query"
    #   @items = Item.where(sql_query, query: "%#{params[:query]}%")
      # @items = Item.where("title ILIKE ? OR category ILIKE ?", params[:query], params[:query])
    # else
      # if(params.key?(:category))
      #   @items = Item.where(category: params[:category]).order("created_at desc")
      # else
      @items = Item.all.order("created_at desc")
      # end
      # @page = params.fetch(:page, 0).to_i
      # @items = @items.offset(@page * ITEMS_PER_PAGE).limit(ITEMS_PER_PAGE)
    # end
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
