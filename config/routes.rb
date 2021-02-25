Rails.application.routes.draw do

  root "students#new"
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "students#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  resources :students
  resources :students do
    resources :studentinfos 
  end
  resources :students do
    resources :results, except: [:update]
  end
  post 'students/:id/results/:id' ,to: 'results#update', as: 'edit_result'
  post 'students/:id/studentinfos/new',to: 'studentinfos#create'
  get 'students/index'


  #post 'new' => 'studentinfo/:id/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
