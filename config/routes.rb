NokiaApp::Application.routes.draw do
  get "/index", :controller => "feed", :action => "index"
  match 'session/:action', :to => 'sessions'
  root :to => "feed#index"
  get "feed/geolocation", :controller => "feed", :action => "geolocation"
  get "static_pages/home", :controller => 'static_pages', :action => 'home'
  get "static_pages/maps", :controller => 'static_pages', :action => 'maploader'
  get "static_pages/xmlcheck", :controller => 'static_pages', :action => 'markersxmltest'
  get "static_pages/markers", :controller => 'static_pages', :action => 'markers'
end
