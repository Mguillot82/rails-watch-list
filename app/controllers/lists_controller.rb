class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def new
    @List = List.new
  end

  def create
    @List = List.new(list_params)
    @List.save
    redirect_to new_movie_list_path(@List)
  end

  def index
    @restaurants = List.all
  end

  def show; end

  def edit; end

  def update
    @List.update(list_params)
    redirect_to list_path(@List)
  end

  def destroy
    @List.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
