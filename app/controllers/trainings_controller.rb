class TrainingsController < ApplicationController

  include Pagy::Backend

  before_action :set_training, only: %i[ show edit update destroy ]

  # GET /trainings or /trainings.json
  def index
    #@trainings = Training.all
    @q = Training.ransack(params[:q])
    @pagy, @trainings = pagy(@q.result, items: 10)
  end

  # GET /trainings/1 or /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings or /trainings.json
  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to training_url(@training), notice: "Treino incluido com sucesso!" }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1 or /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to training_url(@training), notice: "Treino atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1 or /trainings/1.json
  def destroy
    

    begin
      @training.destroy!
      respond_to do |format|
        format.html { redirect_to trainings_url, notice: "Treino deletado com sucesso!" }
        format.json { head :no_content }
      end
    rescue
      respond_to do |format|
        format.html { redirect_to trainings_url, alert: "Treino não pode ser deletado pois está vínculado a outra tela!" }
        format.json { head :no_content }
      end
    end    
  end

  def clear_filters
    # Você pode redefinir os parâmetros de pesquisa para seus valores padrão aqui
    p "caiu no clear_filters"
    redirect_to training_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:name, :single, :reps, :durantion_minutes)
    end
end
