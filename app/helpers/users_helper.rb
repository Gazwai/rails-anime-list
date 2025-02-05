module UsersHelper
  def user_owns_list?(list)
    authenticated? && authenticated?.user == list.user
  end
end
