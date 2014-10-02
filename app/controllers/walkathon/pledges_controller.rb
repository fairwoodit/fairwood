class Walkathon::PledgesController < ApplicationController
  before_action :set_walkathon_pledge, only: [:show, :edit, :update, :destroy]

  # GET /walkathon/pledges
  # GET /walkathon/pledges.json
  def index
    @walkathon_pledges = Walkathon::Pledge.all
  end

  # GET /walkathon/pledges/1
  # GET /walkathon/pledges/1.json
  def show
  end

  # GET /walkathon/pledges/new
  def new
    @walkathon_pledge = Walkathon::Pledge.new
  end

  # GET /walkathon/pledges/1/edit
  def edit
  end

  # POST /walkathon/pledges
  # POST /walkathon/pledges.json
  def create
    @walkathon_pledge = Walkathon::Pledge.new(walkathon_pledge_params)

    respond_to do |format|
      if @walkathon_pledge.save
        format.html { redirect_to @walkathon_pledge, notice: 'Pledge was successfully created.' }
        format.json { render :show, status: :created, location: @walkathon_pledge }
      else
        format.html { render :new }
        format.json { render json: @walkathon_pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /walkathon/pledges/1
  # PATCH/PUT /walkathon/pledges/1.json
  def update
    respond_to do |format|
      if @walkathon_pledge.update(walkathon_pledge_params)
        format.html { redirect_to @walkathon_pledge, notice: 'Pledge was successfully updated.' }
        format.json { render :show, status: :ok, location: @walkathon_pledge }
      else
        format.html { render :edit }
        format.json { render json: @walkathon_pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /walkathon/pledges/1
  # DELETE /walkathon/pledges/1.json
  def destroy
    @walkathon_pledge.destroy
    respond_to do |format|
      format.html { redirect_to walkathon_pledges_url, notice: 'Pledge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_walkathon_pledge
      @walkathon_pledge = Walkathon::Pledge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def walkathon_pledge_params
      params.require(:walkathon_pledge).permit(:sponsor_name, :sponsor_phone, :pledge_per_lap, :maximum_pledge, :fixed_pledge)
    end
end
