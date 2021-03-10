class PagesController < ApplicationController
  def home
    @items = Item.all.order("created_at desc")
    @articles = Article.all.order("created_at desc")
  end

  def about
  end

  def terms
  end
end
