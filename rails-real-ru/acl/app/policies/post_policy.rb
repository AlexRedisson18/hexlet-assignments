# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    admin? || author?
  end

  def update?
    admin? || author?
  end

  def destroy?
    admin?
  end

  private

  def author?
    record.author == user
  end

  def admin?
    user&.admin?
  end
  # END
end

# app/policies/post_policy.rb
# Реализуйте политику для управления постами PostPolicy.
# Создавать посты может только залогиненный пользователь,
# редактировать автор и админ,
# удалять - админ.
# Смотреть могут все.
