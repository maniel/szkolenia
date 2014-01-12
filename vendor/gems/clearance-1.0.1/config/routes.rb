Rails.application.routes.draw do
  resources :passwords,
    :controller => 'clearance/passwords',
    :only => [:create, :new, :index]

  resource :session,
    :controller => 'clearance/sessions',
    :only => [:create]

  resources :users,
    :only => [:create, :index, :edit, :update, :new, :destroy] do
      resource :password,
        :controller => 'clearance/passwords',
        :only => [:create, :edit, :update, :index]
    end

  get '/zaloguj' => 'clearance/sessions#new', :as => 'sign_in'
  delete '/wyloguj' => 'clearance/sessions#destroy', :as => 'sign_out'
  #get '/sign_up' => 'clearance/users#new', :as => 'sign_up' # nie ma samodzielnej rejestracji!
end
