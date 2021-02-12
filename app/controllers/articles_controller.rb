class ArticlesController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :disable_nav, only: [:show]

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  private

  def disable_nav
    @disable_nav = true
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
