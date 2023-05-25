class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  def index
    @movies = Movie.all
  end

  def show; end

  def edit; end

  def update
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy unless @movie.bookmarks.nil?
    redirect_to movies_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
