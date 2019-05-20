module BrandsHelper
  def get_brand_by_id(id)
    Brand.find(id)
  end
end
