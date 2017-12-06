Rails.application.routes.draw do
  
  resources :todo_lists do
  	resources :todo_items do
  		member do
  			patch :complete
  			patch :move_up
  			patch :move_down
  		end
  	end
  end

  root "todo_lists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
