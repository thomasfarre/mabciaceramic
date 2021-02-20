class PagesController < ApplicationController
  def home
    @items = Item.all.order("created_at desc")
  end

  def about
  end
end
