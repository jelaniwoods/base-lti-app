Rails.application.routes.draw do
  Rails.application.routes.draw do
    root "pages#landing"
    devise_for :administrators
    authenticated :administrator do
      root "credentials#index", as: :authenticated_root
    end
    resources :consumptions, only: %i[]
    resources :contexts, only: %i[]
    resources :credentials, only: %i[new create edit destroy index]
    resources :enrollments, only: %i[]
    resources :messages, only: %i[create show]
    resources :resources, only: %i[show edit]
    resources :submissions, only: %i[]
    resources :tool_consumers, only: %i[]
    resources :users, only: %i[]
    resource :launch, only: :create
    get "/config" => "launches#xml_config"
    constraints(->(request) { request.host != "production.app.com" }) do
      get "/teacher" => "resources#teacher_backdoor"
      get "/student" => "resources#student_backdoor"
    end
  end
  
end
