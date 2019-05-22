module BrandsHelper
  def get_brand_name_by_id(id)
    brand = Brand.find(id)
    return "N/A" if brand.nil?
    brand.name
  end
end
