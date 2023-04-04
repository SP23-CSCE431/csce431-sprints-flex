class PointsController < ApplicationController
  include ApplicationHelper
  before_action :set_point, only: %i[ show edit update destroy ]

  # GET /points or /points.json
  # Query all points related to the signed in user id, and points that are not approved/denied (nil)
  # Also, query the signed in user's total points and point total category
  def index
    @user_id = current_admin.id
    @points = Point.where(admin_id: @user_id).where.not(is_approved: nil)
    @pending_points = Point.where(admin_id: @user_id, is_approved: nil)
    @user_total_points = Point.where(admin_id: @user_id, is_approved: true).count
    @num_per_category = Point.joins(:point_category).group(:name).where(admin_id: @user_id, is_approved: true).count
  end

  # GET /points/1 or /points/1.json
  def show
  end

  # GET /points/new
  def new
    @point = Point.new
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points or /points.json
  # Create a new point object, set the user id to the signed in user,
  # and default approval status to none
  def create
    @user_id = current_admin.id

    @point = Point.new(point_params)
    @point.admin_id = @user_id
    @point.is_approved = true

    respond_to do |format|
      if @point.save
        format.html { redirect_to(point_url(@point), notice: "Point was successfully created.") }
        format.json { render(:show, status: :created, location: @point) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @point.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /points/1 or /points/1.json
  # Update a point
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to(point_url(@point), notice: "Point was successfully updated.") }
        format.json { render(:show, status: :ok, location: @point) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @point.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /points/1 or /points/1.json
  # Delete a point
  def destroy
    @point.destroy

    respond_to do |format|
      format.html { redirect_to(points_url, notice: "Point was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  def help
    render "points/help/#{params[:first]}"
  end

  def delete_points
    # Delete all points, will be called from points/delete_points
    if current_admin.role == "Executive"
      Point.delete_all
      flash[:notice] = 'All points have been successfully deleted.'
    else
      flash[:notice] = 'Permission Denied.'
    end
    redirect_to points_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
        @point = Point.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_params
      params.require(:point).permit(:admin_id, :point_category_id, :is_approved, :description, :date_attended)
    end

end
