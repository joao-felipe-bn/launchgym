class InstructorsController < ApplicationController
  include Pagy::Backend
  before_action :set_instructor, only: %i[ show edit update destroy ]

  # GET /instructors or /instructors.json
  def index
    @q = Instructor.ransack(params[:q])
    @pagy, @instructors = pagy(@q.result, items: 10)
  end

  # GET /instructors/1 or /instructors/1.json
  def show
  end

  # GET /instructors/new
  def new
    @instructor = Instructor.new
  end

  # GET /instructors/1/edit
  def edit
  end

  # POST /instructors or /instructors.json
  def create
   
    @instructor = Instructor.new(instructor_params)

    respond_to do |format|
      @instructor.user_id = current_user.id
      if @instructor.save
        format.html { redirect_to instructor_url(@instructor), notice: "Instrutor incluido com sucesso!" }
        format.json { render :show, status: :created, location: @instructor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructors/1 or /instructors/1.json
  def update
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to instructor_url(@instructor), notice: "Instrutor atrualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1 or /instructors/1.json
  def destroy
    begin
      @instructor.destroy!
      respond_to do |format|
        format.html { redirect_to instructors_url, notice: "Instrutor deletado com sucesso!" }
        format.json { head :no_content }
      end
    rescue ActiveRecord::InvalidForeignKey
      respond_to do |format|
        format.html { redirect_to instructors_url, alert: "Instrutor não pode ser deletado pois está vinculado a outra tela!" }
        format.json { head :no_content }
      end
    end
  end

  def clear_filters
    # Você pode redefinir os parâmetros de pesquisa para seus valores padrão aqui
    p "caiu no clear_filters"
    redirect_to instructor_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
      p "*********** current_user.id",current_user.id
      @instructor.user_id = current_user.id
    end

    # Only allow a list of trusted parameters through.
    def instructor_params
      params.require(:instructor).permit(:name, :birth, :email, :document, :phone, :specialities, :user_id)
    end
end
