class AddBrandCategoryToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :brand
    add_reference :users, :category
  end
end
