class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '49ba8a27ff961c736a7b7f0b15e4e408'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  before_filter :authenticate #metodo global de autenticação, está no ApplicationController
  helper_method :session_user #chama o metodo definido no ApplicationHelper

  protected
    def session_user
      @session_user ||= User.find(:first, :conditions => ['id = ?', session[:user]])      
    end

    def authenticate
      unless session[:user]
        session[:return_to] = request.request_uri
        redirect_to :controller => "login", :action => "login"
        return false
      end
      return true
    end

    #before_filter :authenticate_administration

    def authenticate_administration
      unless session_user && session_user.admin?
        redirect_to :action => "Acesso não permitido"
        return false
      end
      return true
    end



end
