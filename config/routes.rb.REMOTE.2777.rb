NokiaApp::Application.routes.draw do
  get "static_pages/home", :controller => 'static_pages', :action => 'home'

  get "static_pages/infobubble", :controller => 'static_pages', :action => 'infobubble'
end
