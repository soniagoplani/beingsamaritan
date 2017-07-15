Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end
  root 'home#home'

   get '/about' => 'home#about'
  get '/contact' => 'home#contact'




  resources :problem_categories do
    resources :problem_posts, only: [:new ,:create]
  end
  resources :problem_posts , only: [] do
    resources :comments, only: [:new ,:create,:destroy]
  end
  get '/problem_posts/:problem_post_id/comments/:id' =>  'comments#destroy'

    resources :event_portfolios, only: [:new ,:create,:destroy,:show,:index]


  resources :problem_posts ,only: [:index ,:show,:edit,:update ,:destroy]

  namespace :organization, path: '' do
    resources :organizations, only: [] do
      get :dashboard, on: :collection
    end
       resources :volunteers, only: [:index]
  end

resources :volunteers, only: [:new, :create]
 

  namespace :volunteer, path: '' do
    resources :volunteers, only: [] do
      get :dashboard, on: :collection
    end
  end
  namespace :samaritan do
    resources :events, only: [:new, :create ]
  end
  resources :event , only: [] do
    resources :participants, only: [:new ,:create,:destroy]
  end
resources :events, only: [:show,:index ]

  namespace :admin do
    resources :dashboard, only: [:index]
  end
  

  get 'get_state_for_country/:country', to: 'home#get_state_for_country'
end
