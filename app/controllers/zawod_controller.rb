# coding: utf-8
class ZawodController < ApplicationController
  before_action :set_zawod, only: [:show, :edit, :update, :destroy]
#  before_action :authorize
  # before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  # GET /zawod
  # GET /zawod.json


  def index
    conditions = {}
    prepare_conditions(conditions) if params[:commit]
    unless params[:query].blank?
      namelike = "%#{params[:query]}%"
      @zawod = Zawod.where(conditions).where("name LIKE ?", namelike)
    else
      @zawod = Zawod.where(conditions)
    end
  end

  # GET /zawod/1
  # GET /zawod/1.json
  def show
  end

  # GET /zawod/new
  def new
    @zawod = Zawod.new
    @zawod.build_organizer
  end

  # GET /zawod/1/edit
  def edit
  end

  # POST /zawod
  # POST /zawod.json
  def create
    @zawod = Zawod.new(zawod_params)
    @zawod.location=Location.find(zawod_params[:location_id].to_i) unless zawod_params[:location_id].blank?
    @zawod.category=Category.find(zawod_params[:category_id].to_i) unless zawod_params[:category_id].blank?
    @zawod.organizer=Organizer.find(zawod_params[:organizer_id].to_i) unless zawod_params[:organizer_id].blank?
    respond_to do |format|
      if @zawod.save
        format.html { redirect_to @zawod, notice: 'Zapisano pomyślnie' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /zawod/1
  # PATCH/PUT /zawod/1.json
  def update
    respond_to do |format|
      if @zawod.update(zawod_params)
        format.html { redirect_to @zawod, notice: 'Zaktualizowano pomyślnie' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /zawod/1
  # DELETE /zawod/1.json
  def destroy
    @zawod.destroy
    respond_to do |format|
      format.html { redirect_to zawod_index_url }
    end
  end

  private

    def prepare_conditions(conditions)
      conditions[:location] = Location.find(params[:location_id].to_i) unless params[:location_id].blank? or params[:location_id] == "18"
      conditions[:category] = Category.find(params[:category_id].to_i) unless params[:category_id].blank?
      conditions[:organizer] = Organizer.find(params[:organizer_id].to_i) unless params[:organizer_id].blank?
      conditions[:elearning] = true if params[:elearning]=='1'
      conditions[:paid] = false if params[:free]=='1'
      puts ">> conditions"
      p conditions
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_zawod
      @zawod = Zawod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zawod_params
      params.require(:zawod).permit(
        :name,
        :description,
        :additional_info,
        :address,
        :costs_semester,
        :costs_info,
        :begin_date,
        :begin_date_text,
        :end_date,
        :end_date_text,
        :term_time,
        :term_info,
        :documents,
        :organizer_id,
        :location_id,
        :category_id,
        :paid,
        :term_additional_info,
        :requirements,
        :school_type,
        :program,
        organizer_attributes: [
          :name,
          :address,
          :contact,
          :link,
          :college
          ])
    end

    def check_admin
      raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
    end
end
