Rails.application.routes.draw do
  get 'welcome/index'         #tells Rails to map requests to http://localhost:3000/welcome/index to the welcome controller's index action
  root 'welcome#index'        #tells Rails to map requests to the root of the application to the welcome controller's index action

  resources :articles do      #defines RESTful article resources
    resources :comments       #comments are a nested resource within articles
  end
end
