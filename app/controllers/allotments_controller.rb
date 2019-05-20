class AllotmentsController < ApplicationController
  before_action :get_allotment_by_id, only: [:deallot]
  before_action :logged_in_user, only: [:index, :new]

  def index
    @allotments = Allotment.all
  end

  def new
    @allotment = Allotment.new
  end

  def create
    @allotment = Allotment.new(allotment_params)
    if Allotment.exists?(user_id: @allotment.user_id, item_id: @allotment.item_id, dealloted_at: nil)
      render 'new', flash: { danger: "The specific user was recently alloted this product and has not been deallocated." }
    elsif @allotment.save
      redirect_to action: 'index', flash: { success: "Item alloted successfully." }
    else
      render 'new'
    end
  end

  def deallot
    if @allotment.update_attribute(:dealloted_at, DateTime.now)
      redirect_to action: 'index', flash: { success: "Item dealloted successfully." }
    end
  end

  private
    def allotment_params
      params.require(:allotment).permit(:user_id, :item_id)
    end

    def get_allotment_by_id
      @allotment = Allotment.find(params[:id])
    end
end
