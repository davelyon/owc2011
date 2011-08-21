Owc2011::Application.routes.draw do
  devise_for :admin

  match 'admin' => "admin#index", as: :admin_root

  match 'admin' => "admin#index"
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
    resources :fundraisers do
      resources :tickets
    end

    controller :twitter do
      match 'tweet', :as => :new_tweet
      get 'post_tweet', :to => :post_tweet, :as => :post_tweet
      match '/:action'
    end
  end

  match 'about' => "main#about"
  match 'services' => "main#services"
  match 'testimonials' => "main#testimonials"
  match 'store' => "main#store"

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

  root :to => "landing#index"
end
