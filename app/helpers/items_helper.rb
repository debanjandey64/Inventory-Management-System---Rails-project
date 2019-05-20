module ItemsHelper
  def item_display_name(item)
    "#{Brand.find(item.brand_id).name} #{item.name} (#{item.quantity})"
  end

  def get_item_by_id(id)
    Item.find(id)
  end

  def get_deallotment_stats(allotment)
    if allotment.dealloted_at.nil?
      "** Currently alloted. **"
    else
      "#{allotment.dealloted_at}"
    end
  end
end
