class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [ :update, :destroy ]
  before_action :set_list, only: [ :update, :create ]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)

    else
      render "lists/index", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  def update
    if @bookmark.update(bookmark_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @bookmark.id,
            partial: "lists/comment",
            locals: { bookmark: @bookmark })
        end

        format.html { redirect_to list_path(@list) }
      end
    else
      render "lists/index", status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :anime_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
