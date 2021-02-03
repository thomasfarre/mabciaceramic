class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @items = Item.all
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
