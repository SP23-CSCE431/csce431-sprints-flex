class PointReviewsController < ApplicationController
  def index
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    @user_id = current_admin.id
      @pending_points = Point.paginate(page: params[:page], per_page: 10).where(is_approved: nil)
      @pending_points_count = Point.where(is_approved: nil).count
  end

  def approve
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    pending_point = Point.find(params[:point_id])
      pending_point.update(is_approved: true)
      redirect_to(point_reviews_path)
  end

  def deny
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    pending_point = Point.find(params[:point_id])
      pending_point.update(is_approved: false)
      redirect_to(point_reviews_path)
  end
end
