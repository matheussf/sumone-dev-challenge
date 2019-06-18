Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'drinks#index'
  get 'search',     :to => 'drinks#search',    :as => :search
  get 'recommend',  :to => 'drinks#recommend', :as => :recommend
  put 'users',      :to => 'users#update_user_preferences', :as => :users
  resources :home, only: %i[index]
end
