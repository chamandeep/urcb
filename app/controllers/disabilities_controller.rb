class DisabilitiesController < ApplicationController
  before_action :set_disability, only: [:show, :edit, :update, :destroy]

  # GET /disabilities
  # GET /disabilities.json
  def index
    @disabilities = Disability.all
  end

  # GET /disabilities/1
  # GET /disabilities/1.json
  def show
    @disability = Disability.find(params[:id])
    @title = @disability.name
    
  end

  # GET /disabilities/new
  def new
    @disability = Disability.new
  end

  # GET /disabilities/1/edit
  def edit
  end

  # POST /disabilities
  # POST /disabilities.json
  def create
    @disability = Disability.new(disability_params)

    respond_to do |format|
      if @disability.save
        format.html { redirect_to @disability, notice: 'Disability was successfully created.' }
        format.json { render action: 'show', status: :created, location: @disability }
      else
        format.html { render action: 'new' }
        format.json { render json: @disability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disabilities/1
  # PATCH/PUT /disabilities/1.json
  def update
    respond_to do |format|
      if @disability.update(disability_params)
        format.html { redirect_to @disability, notice: 'Disability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @disability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disabilities/1
  # DELETE /disabilities/1.json
  def destroy
    @disability.destroy
    respond_to do |format|
      format.html { redirect_to disabilities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disability
      @disability = Disability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disability_params
      params.require(:disability).permit(:name, :description)
    end
end
