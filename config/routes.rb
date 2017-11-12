Rails.application.routes.draw do
<<<<<<< HEAD
  get  'static_pages/home'
  get  'static_pages/help'
  get  'static_pages/about'
=======
  root "static_pages#home"

  get "static_pages/home"

  get "static_pages/help"

  get "static_pages/about"

  get "static_pages/contact"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> 18791fccff8264e959c817ab7810221d089c437a
end
