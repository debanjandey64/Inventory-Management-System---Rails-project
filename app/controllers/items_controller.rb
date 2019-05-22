class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :get_item_by_id, only: [:edit, :update, :show, :manage_item_stock, :update_stock]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, flash: { success: "Item created successfully." }
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @brand_name = Brand.find(@item.brand_id).name
    @category_name = Category.find(@item.category_id).name
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to @item, flash: { success: "Item updated successfully." }
    else
      render 'edit'
    end
  end

  def allotments
    @allotments = Allotment.where(item_id: [params[:id]])
  end

  def manage_item_stock
  end

  def update_stock
    if @item.update_attributes(item_quant_params)
      redirect_to items_url, flash: { success: "Stocks of the items were updated successfully." }
      if @item.in_stock < @item.minimum_required_stock
        for user in User.where(admin: true)
          NotificationMailer.shortage_notification(user, @item).deliver_now
        end
      end
    else
      render 'manage_item_stock'
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :category_id, :brand_id, :price, :quantity, :price)
    end

    def item_quant_params
      params.require(:item).permit(:in_stock, :minimum_required_stock, :procurement_time_in_weeks)
    end

    def get_item_by_id
      @item = Item.find(params[:id])
    end
end
