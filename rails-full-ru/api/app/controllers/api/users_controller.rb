# frozen_string_literal: true

class Api::UsersController < Api::ApplicationController
  # BEGIN
  def show
    @user = User.find(params[:id])

    respond_with @user.as_json(root: true, only: [:first_name, :email])
  end

  def index
    @users = User.all

    respond_with @users.as_json(only: [:first_name, :email])
  end
  # END
end


# Реализуйте обработчики show для получения данных об одном пользователе и index — для получения данных о всех пользователей.
# Используйте метод respond_with для представления сущности в формате JSON.
# Такой подход, когда отдаются все поля не совсем является корректным, потому что сущность может содержать поля, которые нужно скрыть,
# например, в целях безопасности.
# Как правильно решается эта задача, мы рассмотрим в следующем домашнем задании.
