ActionController::Routing::Routes.draw do |map|

  map.resources :agendas

#  map.resources :usuarios
#  map.resource :sessao
#
#  map.signup '/signup', :controller => 'usuarios', :action => 'new'
#  map.login  '/login', :controller => 'sessao', :action => 'new'
#  map.logout '/logout', :controller => 'sessao', :action => 'destroy'
  
  map.login '/login', :controller =>  'login', :action => 'login'
  map.login '/logout', :controller =>  'login', :action => 'logout'


#  mapeia os feeds
  map.feed 'feed', :controller => 'agendas', :action => 'feed'

#  map.resources :usuarios do |user|
#     #user.resources :agendas do |agendas|
#       user.resources :agendas
#     #end
#  end


#  define a página inicial, ou o primeiro controller a se carregado
#  map.root :controller => 'sessao', :action => 'new'

  map.root :controller => 'agendas'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
