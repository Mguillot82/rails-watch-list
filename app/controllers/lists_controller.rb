class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      @list.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_path(@list)
    end
  end

  def index
    @lists = List.all
  end

  def show; end

  def edit; end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    bookmarks = @list.bookmarks
    bookmarks.each(&:destroy)
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
