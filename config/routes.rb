Owc2011::Application.routes.draw do
  devise_for :admin

  match 'admin' => "admin#index"
  namespace "admin" do
    resources :fundraisers
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

  root :to => "landing#index"
end
