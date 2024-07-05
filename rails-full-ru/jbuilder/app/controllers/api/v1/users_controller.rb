# frozen_string_literal: true

class Api::V1::UsersController < Api::ApplicationController
  # BEGIN
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end
  # END
end

# Опишите в контроллере два обработчика:
# index для получения данных о всех пользователях и
# show для получения данных об одном, конкретном пользователе.
