class Staff::RecordStudentsController < ApplicationController
  before_action :set_staff_record_student, only: [:show, :edit, :update, :destroy]

  # GET /staff/record_students
  # GET /staff/record_students.json
  def index
    @staff_record_students = Staff::RecordStudent.all
  end

  # GET /staff/record_students/1
  # GET /staff/record_students/1.json
  def show
  end

  # GET /staff/record_students/new
  def new
    @staff_record_student = Staff::RecordStudent.new
  end

  # GET /staff/record_students/1/edit
  def edit
  end

  # POST /staff/record_students
  # POST /staff/record_students.json
  def create
    @staff_record_student = Staff::RecordStudent.new(staff_record_student_params)

    respond_to do |format|
      if @staff_record_student.save
        format.html { redirect_to @staff_record_student, notice: 'Record student was successfully created.' }
        format.json { render :show, status: :created, location: @staff_record_student }
      else
        format.html { render :new }
        format.json { render json: @staff_record_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/record_students/1
  # PATCH/PUT /staff/record_students/1.json
  def update
    respond_to do |format|
      if @staff_record_student.update(staff_record_student_params)
        format.html { redirect_to @staff_record_student, notice: 'Record student was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff_record_student }
      else
        format.html { render :edit }
        format.json { render json: @staff_record_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/record_students/1
  # DELETE /staff/record_students/1.json
  def destroy
    @staff_record_student.destroy
    respond_to do |format|
      format.html { redirect_to staff_record_students_url, notice: 'Record student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_record_student
      @staff_record_student = Staff::RecordStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_record_student_params
      params.require(:staff_record_student).permit(:title, :ennea, :textbook, :going_school, :created_at, :updated_at)
    end
end
