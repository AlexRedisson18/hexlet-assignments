# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :find_vacancy, only: %i[publish archive]

  def index
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # BEGIN
  def publish
    @vacancy.publish! if @vacancy.on_moderate?

    redirect_to vacancies_path, notice: 'Vacancy was successfully published.'
  end

  def archive
    @vacancy.archive!

    redirect_to vacancies_path, notice: 'Vacancy was successfully archived.'
  end
  # END

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :description)
  end

  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end
end
