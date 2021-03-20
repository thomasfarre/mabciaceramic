class ArticlesController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :disable_nav, :disable_footer, only: [:show]

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all.order("created_at desc")
  end

  private

  def disable_nav
    @disable_nav = true
  end

  def disable_footer
    @disable_footer = true
  end

  def set_item
    @article = Article.find(params[:id])
  end

end
