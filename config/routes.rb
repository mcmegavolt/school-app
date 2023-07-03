Rails.application.routes.draw do
  resources :sections
  resources :classrooms
  resources :subjects
  resources :teachers
  resources :students
  
  root "students#index"
end
