# coding: utf-8
class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]


  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all    
  end

  def studia
    @trainings = Training.where(studies:true, postgrad:false)
  end

  def podyplomowe
    @trainings = Training.where(studies:true, postgrad:true)    
  end

  def szkolenia
    @trainings = Training.where(studies:false)
  end


  # GET /trainings/1
  # GET /trainings/1.json
  def show
    if @training.studies
      puts ">>studia"
      render "show_studia"
    else
      puts ">>szkolenia"
      render "show_szkolenie"
    end
  end

  # GET /trainings/new
  def new
    @training = Training.new
    @locations_array=Location.all.map {|location| [location.name, location.id]}
  end

  def noweszkolenie
    new
    @cat_array=Category.where(studies: false).map { |cat| [cat.name,cat.id] }
  end

  def nowestudia
    new
    @cat_array=Category.where(studies: true).map { |cat| [cat.name,cat.id] }
  end

  # GET /trainings/1/edit
  def edit
    @locations_array=Location.all.map {|location| [location.name, location.id]}
    # @cat_array=Category.all.map { |cat| [cat.name,cat.id] }
    if @training.studies
      puts ">>studia"
      @cat_array=Category.where(studies: true).map { |cat| [cat.name,cat.id] }
      render :edit_studia
    else
      puts ">>szkolenia"
      @cat_array=Category.where(studies: false).map { |cat| [cat.name,cat.id] }
      render :edit_szkolenie
    end
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(training_params)
    @training.location=Location.find(training_params[:location_id].to_i)
    @training.category=Category.find(training_params[:category_id].to_i)
    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Zapisano pomyślnie' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      @training.location=Location.find(training_params[:location_id].to_i)
      @training.category=Category.find(training_params[:category_id].to_i)
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Zaktualizowano pomyślnie' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    if @training.szkolenie?
      red_url=szkolenia_trainings_url
    elsif @training.studia?
      red_url=studia_trainings_url
    else
      red_url=podyplomowe_trainings_url
    end        
    @training.destroy
    respond_to do |format|
      format.html { redirect_to red_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(
        :name, :info, :moreinfo, :target, :methods, :groupsize, :trainer_info
        :studies, :postgrad, :elearning, :paid, :costs, :costs_info, :term,
        :term_info, :begin_date, :end_date,:address, :organizer_name, :organizer_address,
        :organizer_contact, :organizer_link, :location_id, :category_id
        )
    end
end
