Owc2011::Application.routes.draw do
  devise_for :admin  
  
  match 'admin' => "admin#index", as: :admin_root

  namespace "admin" do
    resources :donation_campaigns
    resources :events, except: :show
    resources :fundraisers do
      resources :tickets
    end
  end

  match 'about' => "main#about"
  match 'services' => "main#services"
  match 'testimonials' => "main#testimonials"
  match 'donate' => "main#donate"
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

  root :to => "landing#index"
end
