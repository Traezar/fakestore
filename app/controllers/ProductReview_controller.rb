class ProductReviewController < ApplicationController

  def add_product_review
    bm = ProductReview.new(filtered_params)
    render json: { status: 204 } if bm.save!
  end


  def delete_product_review
    bm = ProductReview.find(params[:id])
    bm.destroy
    render json: { status: 204 }
    
  end
  def filtered_params
    params.fetch(:product_review, [:user_id,:product_id, :title, :content,:rating])
  end
end
