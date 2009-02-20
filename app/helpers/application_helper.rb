# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def yes_or_not?(value)
    if value 
      'Sim'
    else
      'Não'
    end
  end

  def session_user
    @session_user ||= User.find(:first, :conditions => ['id = ?', session[:user]])
  end

end
