class BookmarkController < ApplicationController

  def add_bookmark
    bm = Bookmark.new(filtered_params)
    render json: { message: "bookmark added" }, status: :ok if bm.save!
  end


  def delete_bookmark
    bm = Bookmark.find(params[:id])
    render json: { message: "removed" }, status: :ok if  bm.destroy
  end

  def filtered_params
    params.fetch(:bookmark, [:user_id,:product_id])
  end
end
