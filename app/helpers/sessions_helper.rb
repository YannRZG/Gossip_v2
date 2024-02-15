module SessionsHelper
    def login(user)
      session[:user_id] = user.id
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !current_user.nil?
    end
  
    def logout
      session.delete(:user_id)
      @current_user = nil
    end

    def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
     end
  end
