module SessionsHelper

  def login(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  
    def current_user=(user)
    @current_user = user
  end

    def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
    def loged_in?
    !current_user.nil?
  end

  def logout
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

def current_user?(user)
user == current_user  
end

        def loged_in_user
      redirect_to login_url, notice: "Please sign in." unless loged_in?
    end

end