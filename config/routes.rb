Rails.application.routes.draw do
  resources :hotels do 
    resources :rooms
    member do
      delete :purge_avatar
    end
      delete "attachements/:id/purge", to: "attachements#purge", as: "purge_attachement"
  end
  # resources :rooms

  delete "attachements/:id/purge", to: "attachements#purge", as: "purge_attachement"
end
