Owc2011::Application.routes.draw do
  devise_for :admin

  resource :facebook_account
  match '/callback/facebook/:id' => "facebook_accounts#callback", :as => :facebook_callback

  match 'admin' => "admin#index", as: :admin_root

  match 'about' => "main#about"
  match 'services' => "main#services"
  match 'testimonials' => "main#testimonials"
  match 'donate' => "main#donate"
  match 'store' => "main#store"

  namespace "admin" do
    resources :donation_campaigns
    resources :events
    resources :fundraisers do
      resources :tickets
    end
    resources :kids_corners

    resources :socials, only: [:new, :create], :path => "social"
  end

  resources :donation_campaigns

  resources :donations, :only => [:index] do
    collection do
      get :successful
      post '/successful' => redirect('/donations/successful') #paypal is going to redirect with POST
    end
  end

  resources :donations, :only => :index

  resources :contact_requests, only: [:create, :new]

  resources :kids_corners, only: [:index, :show]
  get '/events(/:year(/:month))' => 'events#index', as: :events, constraints: {year: /\d{4}/, month: /\d{1,2}/}
  resources :events, :fundraisers, only: :show
  resources :newsletter_subscriptions, only: :create

  root :to => "landing#index"
end
