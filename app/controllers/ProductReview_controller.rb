class ProductReviewController < ApplicationController

  def add_product_review
    bm = ProductReview.new(filtered_params)
    render json: { head :no_content } if bm.save!
  end


  def delete_product_review
    bm = ProductReview.find_by(filtered_params)
    bm.destroy
    render json: { head :no_content }
    
  end
  def filtered_params
    params.fetch(:product_review, [:user_id,:product_id, :title, :content,:rating])
  end
end
