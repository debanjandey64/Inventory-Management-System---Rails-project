module UsersHelper
  def get_user_name_by_id(id)
    "#{User.find(id).name}"
  end
end
