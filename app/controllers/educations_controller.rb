class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
    @educations = Education.find(params[:id])
  end

  # GET /educations/new
  def new
    @education = Education.new
    @title = "Add New Education Record"
  end

  # GET /educations/1/edit
  def edit
    @educations = Education.find(params[:id])
  end

  # POST /educations
  
  def create
    @education = Education.new(education_params)
if @education.save
  redirect_to current_user
  flash[:success] = "New education record has been added successfully."
else
  render new
end
      end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to current_user, notice: 'Your education record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:user_id, :course_id, :university_id, :startDate, :endDate, :accessibilityReview, :supportRequested, :supportReceived, :reason, :disabilityDeptRating, :courseDeptRating)
    end
end
