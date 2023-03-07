class PointsController < ApplicationController
  before_action :set_point, only: %i[ show edit update destroy ]

  # GET /points or /points.json
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
  def create
    @user_id = current_admin.id

    @point = Point.new(point_params)
    @point.admin_id = @user_id
    @point.is_approved = nil

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
  def destroy
    @point.destroy

    respond_to do |format|
      format.html { redirect_to(points_url, notice: "Point was successfully destroyed.") }
      format.json { head(:no_content) }
    end
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
