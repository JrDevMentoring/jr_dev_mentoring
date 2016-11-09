class InternshipsController < ApplicationController
  before_action :set_internship, only: [:show, :edit, :update, :destroy]

  # GET /internships
  # GET /internships.json
  def index
    @internships = Internship.all
  end

  # GET /internships/1
  # GET /internships/1.json
  def show
  end

  # GET /internships/new
  def new
    @internship = current_user.internships.new
  end

  # GET /internships/1/edit
  def edit
  end

  # POST /internships
  # POST /internships.json
  def create
    @internship = current_user.internships.new(internship_params)

    respond_to do |format|
      if @internship.save
        format.html { redirect_to @internship, notice: 'Internship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @internship }
      else
        format.html { render action: 'new' }
        format.json { render json: @internship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internships/1
  # PATCH/PUT /internships/1.json
  def update
    respond_to do |format|
      if @internship.update(internship_params)
        format.html { redirect_to @internship, notice: 'Internship was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @internship }
      else
        format.html { render action: 'edit' }
        format.json { render json: @internship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internships/1
  # DELETE /internships/1.json
  def destroy
    @internship.destroy
    respond_to do |format|
      format.html { redirect_to internships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internship
      @internship = Internship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internship_params
      params.require(:internship).permit(:title, :description, :application_link, :deadline)
    end
end
