# coding: utf-8
class OrganizersController < ApplicationController
  before_action :set_organizer, only: [:show, :edit, :update, :destroy]
#  before_action :authorize
#  before_action :check_admin, only: [:show, :new, :create, :edit, :update, :destroy, :index]

  # GET /organizers
  # GET /organizers.json
  def index
    @organizers = Organizer.all.order(:name)
  end

  # GET /organizers/1
  # GET /organizers/1.json
  def show
  end

  # GET /organizers/new
  def new
    @organizer = Organizer.new
  end

  # GET /organizers/1/edit
  def edit
  end

  # POST /organizers
  # POST /organizers.json
  def create
    @organizer = Organizer.new(organizer_params)

    respond_to do |format|
      if @organizer.save
        format.html { redirect_to @organizer, notice: 'Organizator został pomyślnie dodany.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /organizers/1
  # PATCH/PUT /organizers/1.json
  def update
    respond_to do |format|
      if @organizer.update(organizer_params)
        format.html { redirect_to @organizer, notice: 'Dane organizatora zostąły pomyślnie zaktualizowane.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /organizers/1
  # DELETE /organizers/1.json
  def destroy
    begin
      @organizer.destroy
      respond_to do |format|
        format.html { redirect_to organizers_url }
      end
    rescue ActiveRecord::DeleteRestrictionError
      respond_to do |format|
        format.html { redirect_to organizers_url, alert: "Nie można usunąć organizatora który ma przypisane szkolenia" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizer_params
      params.require(:organizer).permit(:name, :address, :contact, :link, :college)
    end

    def check_admin
      raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
    end
end
