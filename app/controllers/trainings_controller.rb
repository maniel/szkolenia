# coding: utf-8
class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:noweszkolenie, :nowestudia, :create, :edit, :update, :destroy]

  # GET /trainings
  # GET /trainings.json

  def index
    @trainings = Training.all    
  end

  def prepare_conditions(conditions)
  	conditions[:location] = Location.find(params[:location_id].to_i) unless params[:location_id].blank? or params[:location_id] == "18"
    conditions[:category] = Category.find(params[:category_id].to_i) unless params[:category_id].blank?
  	conditions[:elearning] = true if params[:elearning]=='1'
  	conditions[:paid] = true if params[:paid]=='1'
  	puts ">> conditions"
  	p conditions
  end

  def studia_wyzsze
  	conditions= {studies: true, postgrad: false}
  	prepare_conditions(conditions) if params[:commit]
  	unless params[:query].blank?
  		namelike = "%#{params[:query]}%"
  		@trainings = Training.where(conditions).where("name LIKE ?", namelike)
  	else
  		@trainings = Training.where(conditions)
  	end
  end

  def studia_podyplomowe
  	conditions= {studies: true, postgrad: true}
  	prepare_conditions(conditions) if params[:commit]
  	unless params[:query].blank?
  		namelike = "%#{params[:query]}%"
  		@trainings = Training.where(conditions).where("name LIKE ?", namelike)
  	else
  		@trainings = Training.where(conditions)
  	end
  end

  def szkolenia  	
  	conditions = {studies: false}
  	prepare_conditions(conditions) if params[:commit]
  	unless params[:query].blank?
  		namelike = "%#{params[:query]}%"
  		@trainings = Training.where(conditions).where("name LIKE ?", namelike)
  	else
  		@trainings = Training.where(conditions)
  	end
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
    @training.build_organizer
  end

  
  alias_method :noweszkolenie, :new

  alias_method :nowestudia, :new

  # GET /trainings/1/edit
  def edit
    if @training.studies
      puts ">>studia"
      render :edit_studia
    else
      puts ">>szkolenia"
      render :edit_szkolenie
    end
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(training_params)
    @training.location=Location.find(training_params[:location_id].to_i) unless training_params[:location_id].blank?
    @training.category=Category.find(training_params[:category_id].to_i) unless training_params[:category_id].blank?
    @training.organizer=Organizer.find(training_params[:organizer_id].to_i) unless training_params[:organizer_id].blank?
    p training_params
    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Zapisano pomyślnie' }
      else
        format.html do
          if @training.studies
            render action: "nowestudia"            
          else
            render action: "noweszkolenie"
          end
        end
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      @training.location=Location.find(training_params[:location_id].to_i) unless training_params[:location_id].blank?
      @training.category=Category.find(training_params[:category_id].to_i) unless training_params[:category_id].blank?
      @training.organizer=Organizer.find(training_params[:organizer_id].to_i) unless training_params[:organizer_id].blank?
      @training.trainers=Trainer.find(training_params[:trainer_ids][1..-1].map {|trainer_id| trainer_id.to_i}) unless training_params[:trainer_ids].blank?
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Zaktualizowano pomyślnie' }
      else
        format.html do
          if @training.studies
            render action: 'edit_studia'
          else            
            render action: 'edit_szkolenie'
          end
        end          
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    if @training.szkolenie?
      red_url=szkolenia_trainings_url
    elsif @training.studia?
      red_url=studia_wyzsze_trainings_url
    else
      red_url=studia_podyplomowe_trainings_url
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
        :name, :info, :moreinfo, :target, :methods, :groupsize, :trainer_info, :studies, :postgrad, :elearning, :paid, :costs, :costs_info, :term, :term_info, :begin_date, :end_date,:address, :organizer_id, :location_id, :category_id, organizer_attributes: [:name, :address, :contact, :link, :college], trainer_ids: [] )
    end
end
