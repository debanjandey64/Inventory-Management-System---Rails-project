module CategoriesHelper
  def get_category_name_by_id(id)
    category = Category.find(id)
    return "N/A" if category.nil?
    category.name
  end
end
