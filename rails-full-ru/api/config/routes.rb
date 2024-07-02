# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'home#index'

    resources :users
  end

  # BEGIN
  namespace :api do
    resources :users, only: [:show, :index]
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# Для роутинга будем использовать знания, полученные из прошлых уроков, поэтому в неймспейс api добавьте ресурсный роут users,
# который реализует только методы index и show.
# Запустите приложение с помощью make start и проверьте,
# что при запросе на
# localhost:3000/api/users.json и
# localhost:3000/api/users/<user_id>.json
# содержимое отдаётся в JSON формате.
