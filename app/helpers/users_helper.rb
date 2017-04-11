module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, im_class, size: 80 )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: im_class)
  end
  # Before filters
  private
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # Confirms the correct logged-in user.
    def correct_user
      @user = User.friendly.where('lower(username) = ?', params[:id].downcase).first
      redirect_to(root_url) unless current_user?(@user)
    end
end
