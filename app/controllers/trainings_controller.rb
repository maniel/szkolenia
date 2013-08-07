# coding: utf-8
class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  # GET /trainings
  # GET /trainings.json
  def index
    p params
    if params[:studies] and params[:postgrad] #studia
      puts ">>podyplomowe"
      @trainings = Training.where(studies:true, postgrad:true) #podyplomowe
    elsif params[:studies] and !params[:postgrad]
      puts ">>normalne"
      @trainings = Training.where(studies:true, postgrad:false) #normalne
    elsif !params[:studies]
      puts ">>szkolenia"
      @trainings = Training.where(studies:false) #szkolenia
    else
      @trainings = Training.all
      puts "trainings"
    end
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
    if @training.studies and @training.postgrad #studia
      puts ">>podyplomowe"
      render "show_podyplomowe"
    elsif @training.studies and !@training.postgrad
      puts ">>normalne"
      render "show_studia"
    elsif !@training.studies
      puts ">>szkolenia"
      render "show_szkolenia"
    else
      puts "error!!!!"
      redirect_to :index
    end
  end

  # GET /trainings/new
  def new
    @training = Training.new
    @locations_array=Location.all.map {|location| [location.name, location.id]}
    @cat_array=Category.all.map { |cat| [cat.name,cat.id] }
  end

  # GET /trainings/1/edit
  def edit
    @locations_array=Location.all.map {|location| [location.name, location.id]}
    @cat_array=Category.all.map { |cat| [cat.name,cat.id] }
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
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url }
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
      params.require(:training).permit(:name, :info, :moreinfo, :studies, :postgrad, :elearning, :paid, :costs, :term, :address, :organizer, :location_id, :category_id)
    end
end
