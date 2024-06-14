class ClassSessionStudentsController < ApplicationController
  before_action :set_class_session_student, only: %i[ show edit update destroy ]

  # GET /class_session_students or /class_session_students.json
  def index
    p "Veio o params?",params.to_s
    p "Veio o class_sessions_id?",params[:class_sessions_id].present?

    if params[:class_sessions_id].present?
      @class_session_students = ClassSessionStudent.where(class_sessions_id: params[:class_sessions_id])
    else 
      @class_session_students = ClassSessionStudent.all
    end
  end

  # GET /class_session_students/1 or /class_session_students/1.json
  def show
  end

  # GET /class_session_students/new
  def new
    @class_session_student = ClassSessionStudent.new
  end

  # GET /class_session_students/1/edit
  def edit
  end

  # POST /class_session_students or /class_session_students.json
  def create
    p "params: ",class_session_student_params.to_s

    @student = Student.find_by(id: class_session_student_params[:students_id])
    @classSession = ClassSession.find_by(id: class_session_student_params[:class_sessions_id])

    @class_session_student = ClassSessionStudent.new(class_session_student_params)
   
    p "class_session_student2: ",@class_session_student
    respond_to do |format|
      if @class_session_student.save
        format.html { redirect_to class_session_student_url(@class_session_student), notice: "Aluno incluido na turma" }
        format.json { render :show, status: :created, location: @class_session_student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_session_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_session_students/1 or /class_session_students/1.json
  def update
    respond_to do |format|
      if @class_session_student.update(class_session_student_params)
        format.html { redirect_to class_session_student_url(@class_session_student), notice: "Aluno atualizado na turma" }
        format.json { render :show, status: :ok, location: @class_session_student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_session_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_session_students/1 or /class_session_students/1.json
  def destroy
    @class_session_student.destroy!

    respond_to do |format|
      format.html { redirect_to class_session_students_url, notice: "Aluno removido da turma" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_session_student
      @class_session_student = ClassSessionStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_session_student_params
      params.require(:class_session_student).permit(:students_id, :class_sessions_id)
    end
end
