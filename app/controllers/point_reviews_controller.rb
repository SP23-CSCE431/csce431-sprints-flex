class PointReviewsController < ApplicationController
    before_action :set_point, only: %i[ approve deny ]

    def index
        @user_id = current_admin.id
        @pending_points = Point.paginate(page: params[:page], per_page: 10).where(is_approved: nil)
        @pending_points_count = Point.where(is_approved: nil).count
    end    

    def approve
        pending_point = Point.find(params[:point_id])
        pending_point.point.update(is_approved: true)
        redirect_to point_reviews_path
    end    

    def deny
        pending_point = Point.find(params[:point_id])
        pending_point.point.update(is_approved: false)
        redirect_to point_reviews_path
    end    
end
