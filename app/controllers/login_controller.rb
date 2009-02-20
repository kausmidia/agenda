class LoginController < ApplicationController

  skip_before_filter :authenticate

  #usa o layout padrão de agendas
  layout "agendas"

  def login
    if request.post?
      if @user = User.find_by_login_and_password(params[:login],params[:password])
        session[:user] = @user.id
        if session[:return_to] && !session[:return_to].include?(url_for(:action => "login"))
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          redirect_to :controller => "agendas", :action => "index"
        end
      else
        flash[:notice] = "Dados inválidos"
      end
    end
  end

  def logout
    session[:user] = nil
  end

end
