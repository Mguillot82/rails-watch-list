class MovieController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  def index
    @restaurants = Movie.all
  end

  def show; end;

  def edit
  end

  def update
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    reviews = @movie.reviews
    reviews.each(&:destroy)
    @movie.destroy
    redirect_to movies_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :address, :phone_number, :category)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
