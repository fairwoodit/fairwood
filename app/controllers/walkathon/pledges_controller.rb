class Walkathon::PledgesController < ApplicationController
  before_action :set_walkathon_pledge, only: [:show, :edit, :update, :destroy]

  # GET /walkathon/pledges
  # GET /walkathon/pledges.json
  def index
    # TODO: Enable if/when we figure out authentication
#    @walkathon_pledges = Walkathon::Pledge.all
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
    student                       = Student.find_by(full_name: params[:student_name])
    @walkathon_pledge             = Walkathon::Pledge.new(
      params[:walkathon_pledge][:pledge_type] == 'fixed' ? fixed_params : per_lap_params
    )
    @walkathon_pledge.student     = student

    respond_to do |format|
      if @walkathon_pledge.save
        format.html { redirect_to :thankyou, notice: 'Pledge was successfully created.' }
        format.json { render :show, status: :created, location: @walkathon_pledge }
      else
        format.html { render :new }
        format.json { render json: @walkathon_pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def thankyou
    # Show thank you page.
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
  def fixed_params
    params.require(:walkathon_pledge).permit(:sponsor_name, :sponsor_phone, :pledge_type, :fixed_pledge)
  end

  def per_lap_params
    params.require(:walkathon_pledge).permit(:sponsor_name, :sponsor_phone, :pledge_type, :pledge_per_lap, :maximum_pledge)
  end
end
