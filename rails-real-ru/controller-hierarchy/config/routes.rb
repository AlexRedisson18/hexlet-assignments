# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'home#index'

    resources :movies do
      # BEGIN
      scope module: :movies do
        resources :reviews, except: %i[show]
        resources :comments, except: %i[show]
      end
      # END
    end

    resources :reviews, only: %i[index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# app/config/routes.rb
# Напишите ресурсные роуты для вложенных ресурсов: комментария и ревью.

# scope module: :web do
#   namespace :admin do
#   end

#   root 'home#index'

#   shallow do
#     resources :books, only: index do
#       resources :comments, except: [:edit, :update]
#     end

#     resources :users do
#       resources :books
#       resources :comments, only: [:index]
#     end
#   end
# end
