class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all.order(id: "DESC")
  end


  def create
    shopping_list = ShoppingList.create(item_name: params[:item_name])
    # フロントエンドへjson形式でデータ返却
    render json: { post: shopping_list}
  end


  def order
    shopping_list = ShoppingList.find(params[:id])
    shopping_list.destroy
  end


end