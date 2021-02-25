class StudentsController < ApplicationController
  #before_action :set_student, only: %i[ show edit update destroy index]
  #skip_before_action :authorized, only: [:new, :create, :welcome]

  # GET /students or /students.json
  def index
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.find(params[:id])
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

    if @student.save
      redirect_to @student, notice: "Student was successfully created." 
    else
      render :new
    end

    # respond_to do |format|
    #   if @student.save
    #     format.html { redirect_to @student, notice: "Student was successfully created." }
    #     format.json { render :show, status: :created, location: @student }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @student.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    if @student.update(student_params)
        redirect_to @student, notice: "Student was successfully updated." 
    else
        render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url, notice: "Student was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:email, :password, :password_confirmation)
    end
end
