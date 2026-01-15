class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new()
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.find(@list.id)
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to @list
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
