class ImpairmentsController < ApplicationController
  before_action :set_impairment, only: [:show, :edit, :update, :destroy]

  # GET /impairments
  def index
    @impairments = Impairment.all
  end

  # GET /impairments/1
  def show
    @impairment = Impairment.find(params[:id])
  end

  # GET /impairments/new
  def new
    @impairment = Impairment.new
    @title = "Add Impairment"
  end

  # GET /impairments/1/edit
  def edit
    @impairment = Impairment.find(params[:id])
    @title = "edit impairment"
  end

  # POST /impairments
  def create
    @impairment = Impairment.new(impairment_params)

    if @impairment.save
      redirect_to current_user, notice: 'Your Impairment was added to your profile.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /impairments/1
  def update
    if @impairment.update(impairment_params)
      redirect_to current_user, notice: 'Your Impairment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /impairments/1
  def destroy
    @impairment.destroy
    redirect_to impairments_url, notice: 'Your Impairment was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impairment
      @impairment = Impairment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def impairment_params
      params.require(:impairment).permit(:disability_id, :user_id, :severity, :other, :supportRequired)
    end
end
