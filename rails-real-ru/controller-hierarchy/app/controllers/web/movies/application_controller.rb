# frozen_string_literal: true

module Web
  module Movies
    class ApplicationController < Web::ApplicationController
      helper_method :resource_movie

      def resource_movie
        # BEGIN
        @resource_movie ||= Movie.find params[:movie_id]
        # END
      end
    end
  end
end

# app/controllers/web/movies/application_controller.rb
# Познакомьтесь со статьей Иерархия контроллеров и реализуйте метод для получения текущего фильма resource_movie,
# к которому относятся связанные сущности.
# reviews_controller и comments_controller должны быть зависимыми
