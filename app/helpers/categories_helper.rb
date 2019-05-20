module CategoriesHelper
  def get_category_by_id(id)
    Category.find(id)
  end
end
