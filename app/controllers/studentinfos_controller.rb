class StudentinfosController < ApplicationController
  def index
    @studentinfo = Studentinfo.find(params[:student_id])
    @studentinfos = Studentinfo.all
  end

  def show
    @student = Student.find(params[:student_id])
    @studentinfo = @student.studentinfo
  end

  def new
    @studentinfo = Studentinfo.new
    @studentinfo.student = Student.find(params[:student_id])
  end

  def create
    @student = Student.find(params[:id])
    @studentinfo = @student.create_studentinfo(studentinfo_params)
    if @studentinfo.save
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    @studentinfo = @student.studentinfo
  
    if @studentinfo.update(studentinfo_params)
      redirect_to student_studentinfo_path
    else
      render :edit
    end
  end
  
  def destroy
    @studentinfo = Studentinfo.find(params[:student_id])
    @studentinfo.destroy
    redirect_to student_path
  end
  
  private 
  def studentinfo_params
    params.require(:studentinfo).permit(:name, :dob, :parentemail, :address, :education, :permanentaddress, :phoneNo, :gender, :address, :id, :student_id)
  end
end
