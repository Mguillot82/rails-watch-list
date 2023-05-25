class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_movie, only: %i[show]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_movie
    @move = Movie.find(params[:movie_id])
  end
end
