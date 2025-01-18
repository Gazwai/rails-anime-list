module UsersHelper
  def user_owns_list?(list)
    authenticated?.user == list.user
  end
end
