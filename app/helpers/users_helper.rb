module UsersHelper
  def user_owns_list?(list)
    Current.user == list.user
  end

  def user_logged_in?
    Current.session
  end
end
