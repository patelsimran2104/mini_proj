class StudentinfosController < ApplicationController
  # before_action :set_id, only: [:create]
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
    end

    def create
      @student = Student.find(params[:id])
      @studentinfo = @student.create_studentinfo(studentinfo_params)
      @studentinfo.save
      flash[:notice] = "success"
      redirect_to student_path(@studentinfo)
    end
  
    def edit
      @student = Student.find(params[:id])
      # @studentinfo = @student.studentinfo
      # @studentinfo = Student.find(params[:id])
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
    # def set_id
    #   @studentinfo.student_id = @student.id
    # end
    def studentinfo_params
        params.require(:studentinfo).permit(:name, :address, :id, :student_id)
    end
end

