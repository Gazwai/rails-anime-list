class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @list = List.new

    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    @list.user = Current.user

    if @list.save
      redirect_to list_path(@list), notice: "List created successfully"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
