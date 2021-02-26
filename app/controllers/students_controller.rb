class StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to new_student_studentinfo_path(@student), notice: "Student was successfully created." 
    else
      render :new
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
        redirect_to @student, notice: "Student was successfully updated." 
    else
        render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    byebug
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to root_path, notice: "Student was successfully destroyed." 
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:email, :password, :password_confirmation, :id)
    end
end
