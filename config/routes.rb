Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # API Rooting
  namespace 'api' do
    # namespace 'v0' do
    #   resources :posts
    # end
    namespace 'v1' do
      resources :posts
    end
  end

end
