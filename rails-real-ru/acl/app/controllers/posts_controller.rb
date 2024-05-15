# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new

    authorize @post
  end

  def edit; end

  def create
    authorize Post
    @post = current_user.posts.build(post_params)

    # @post = Post.new post_params
    # @post.author = current_user

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post&.destroy!

    redirect_to posts_url, notice: t('.success')
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post ||= Post.find params[:id]
    authorize @post
  end
  # END
end

# app/controllers/posts_controller.rb
# Реализуйте CRUD для управления постами.
# Используйте политику для авторизации действий пользователя.
