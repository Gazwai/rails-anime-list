module UsersHelper
  def user_owns_list?(list)
    Current.user == list.user
  end
end
