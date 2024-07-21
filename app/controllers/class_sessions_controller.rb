class ClassSessionsController < ApplicationController
  
  include Pagy::Backend

  before_action :set_class_session, only: %i[ show edit update destroy ]

  # GET /class_sessions or /class_sessions.json
  def index
   @q = ClassSession.ransack(params[:q])
   @pagy, @class_sessions = pagy(@q.result, items: 10)
  end

  # GET /class_sessions/1 or /class_sessions/1.json
  def show
  end

  # GET /class_sessions/new
  def new
    @class_session = ClassSession.new
  end

  # GET /class_sessions/1/edit
  def edit
  end

  # POST /class_sessions or /class_sessions.json
  def create
    @class_session = ClassSession.new(class_session_params)

    respond_to do |format|
      if @class_session.save
        format.html { redirect_to class_session_url(@class_session), notice: "Turma incluida com sucesso!" }
        format.json { render :show, status: :created, location: @class_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_sessions/1 or /class_sessions/1.json
  def update
    respond_to do |format|
      if @class_session.update(class_session_params)
        format.html { redirect_to class_session_url(@class_session), notice: "Turma atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @class_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_sessions/1 or /class_sessions/1.json
  def destroy
    begin
    @class_session.destroy!

    respond_to do |format|
      format.html { redirect_to class_sessions_url, notice: "Turma deletada com sucesso!" }
      format.json { head :no_content }
    end
  rescue ActiveRecord::InvalidForeignKey
    respond_to do |format|
      format.html { redirect_to class_sessions_url, alert: "Turma não pode ser deletada poís está vínculada a outra tela!" }
      format.json { head :no_content }
      end
    end  
  end

  def clear_filters
    # Você pode redefinir os parâmetros de pesquisa para seus valores padrão aqui
    p "caiu no clear_filters"
    redirect_to class_sessions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_session
      @class_session = ClassSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_session_params
      params.require(:class_session).permit(:name, :description, :active, :start_time, :end_time, :instructor_id, :training_id)
    end
end
