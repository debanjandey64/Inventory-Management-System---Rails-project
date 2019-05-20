class AddModifyColumnsToTables < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :users, name: :brand_id
    remove_foreign_key :users, name: :category_id
    add_column :users, :mobile_no, :string
    add_column :items, :minimum_required_stock, :integer
    add_column :items, :procurement_time_in_months, :integer
    add_column :items, :quantity, :string
  end
end
