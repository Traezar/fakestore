class BookmarkController < ApplicationController

  def add_bookmark
    bm = Bookmark.new(filtered_params)
    render json: { head :no_content } if bm.save!
  end


  def delete_bookmark
    bm = Bookmark.find_by(filtered_params)
    bm.destroy
    render json: { head :no_content }
    
  end

  def filtered_params
    params.fetch(:bookmark, [:user_id,:product_id])
  end
end
