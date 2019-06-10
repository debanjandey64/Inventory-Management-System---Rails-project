class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :allotments, dependent: :destroy
  has_many :issues, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def item_display_name
    @brand_name = brand_id.nil? ? "<Brand N/A>" : Brand.find(brand_id).name
    "#{@brand_name} #{name} #{quantity}"
  end
end
