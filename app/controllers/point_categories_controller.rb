class PointCategoriesController < ApplicationController
  before_action :set_point_category, only: %i[ show edit update destroy ]

  # GET /point_categories or /point_categories.json
  # Query all point category objects
  def index
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    @point_categories = PointCategory.all
  end

  # GET /point_categories/1 or /point_categories/1.json
  def show
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
  end

  # GET /point_categories/new
  def new
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    @point_category = PointCategory.new
  end

  # GET /point_categories/1/edit
  def edit
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
  end

  # POST /point_categories or /point_categories.json
  # Create a new point category object
  def create
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    @point_category = PointCategory.new(point_category_params)

    respond_to do |format|
      if @point_category.save
        format.html { redirect_to(point_category_url(@point_category), notice: "Point category was successfully created.") }
        format.json { render(:show, status: :created, location: @point_category) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @point_category.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /point_categories/1 or /point_categories/1.json
  # Update a point category
  def update
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    respond_to do |format|
      if @point_category.update(point_category_params)
        format.html { redirect_to(point_category_url(@point_category), notice: "Point category was successfully updated.") }
        format.json { render(:show, status: :ok, location: @point_category) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @point_category.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /point_categories/1 or /point_categories/1.json
  # Delete a point category
  def destroy
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    @point_category.destroy

    respond_to do |format|
      format.html { redirect_to(point_categories_url, notice: "Point category was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_category
      @point_category = PointCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_category_params
      params.require(:point_category).permit(:name, :value)
    end
end
