module UsersHelper
  def signed_in?
    current_user.present?
  end

end
