class UserDisabilitiesController < ApplicationController
  before_action :set_user_disability, only: [:show, :edit, :update, :destroy]

  # GET /user_disabilities
  # GET /user_disabilities.json
  def index
    @user_disabilities = UserDisability.all
  end

  # GET /user_disabilities/1
  # GET /user_disabilities/1.json
  def show
  end

  # GET /user_disabilities/new
  def new
    @user_disability = UserDisability.new
  end

  # GET /user_disabilities/1/edit
  def edit
  end

  # POST /user_disabilities
  # POST /user_disabilities.json
  def create
    @user_disability = UserDisability.new(user_disability_params)

    respond_to do |format|
      if @user_disability.save
        format.html { redirect_to @user_disability, notice: 'User disability was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_disability }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_disability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_disabilities/1
  # PATCH/PUT /user_disabilities/1.json
  def update
    respond_to do |format|
      if @user_disability.update(user_disability_params)
        format.html { redirect_to @user_disability, notice: 'User disability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_disability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_disabilities/1
  # DELETE /user_disabilities/1.json
  def destroy
    @user_disability.destroy
    respond_to do |format|
      format.html { redirect_to user_disabilities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_disability
      @user_disability = UserDisability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_disability_params
      params.require(:user_disability).permit(:disability_id, :user_id, :severity, :supportRequired)
    end
end
