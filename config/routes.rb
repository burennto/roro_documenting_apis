RoroDocumentingApis::Application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :people, :only => [ :index, :show, :create, :update, :destroy ] do
        resources :quotations, :only => [ :index, :show, :create, :update, :destroy ]
      end

    end
  end

end
