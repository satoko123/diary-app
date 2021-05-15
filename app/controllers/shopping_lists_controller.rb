class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all.order(id: "DESC")
  end
end

  def create
    ShoppingList.create(item_name: params[:item_name])
    redirect_to action: :index
  end