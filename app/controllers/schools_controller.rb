class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :update, :edit, :destroy]

  # GET /schools
  def index
    @schools = School.all 
  end

  # GET /schools/1
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/edit
  def create
    @school = School.create(school_params)
    if @school.save
      redirect_to @school
    else
      render :new
    end
  end

  # POST /schools
  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to @school
    else
      render :edit
    end
  end

  # DELETE /schools
  def destroy
    @school.destroy
    redirect_to schools_url
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
    end

    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.

end
