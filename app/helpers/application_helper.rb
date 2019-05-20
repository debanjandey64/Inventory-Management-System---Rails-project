module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Inventory Management System"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def display_na_if_nil_else_value(attribute, prefix='', suffix='')
    if attribute.nil?
      "N/A"
    else
      "#{prefix} #{attribute} #{suffix}"
    end
  end
end
