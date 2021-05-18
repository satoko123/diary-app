class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.where(user_id:current_user.id).order(id: "DESC")
  end


  def create
    binding.pry
    shopping_list = ShoppingList.create(item_name: params[:item_name], user_id: current_user.id)
    # フロントエンドへjson形式でデータ返却
    render json: {post: shopping_list}
  end


  def order
    shopping_lists = ShoppingList.find(params[:check])
    order_lists = []
    shopping_lists.each do |shopping_list|
      order_lists << shopping_list.id
      shopping_list.destroy
    end
    # フロントエンドへjson形式でデータ返却
    render json: {post: order_lists}
  end


end