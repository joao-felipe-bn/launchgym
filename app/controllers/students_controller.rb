class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      @student.user_id = current_user.id
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Aluno incluido com sucesso!" }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Aluno atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    begin
      @student.destroy!
      respond_to do |format|
        format.html { redirect_to students_url, notice: "Aluno deletado com sucesso!" }
        format.json { head :no_content }
      end
    rescue ActiveRecord::InvalidForeignKey
      respond_to do |format|
        format.html { redirect_to students_url, alert: "Aluno não pode ser deletado pois está vínculado a outra tela!" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :birth_date, :email, :document, :phone, :user_id)
    end
end
