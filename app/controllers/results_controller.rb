class ResultsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @results = @student.results.all
  end

  def show
    @student = Student.find(params[:student_id])
    @result = @student.results
  end

  def new
    @result = Result.new
  end

  def create
    @student = Student.find(params[:student_id])
    @result = @student.results.create(studentinfo_params)
    @result.save
    flash[:notice] = "success"
    redirect_to student_results_path(@student)
  end
  
  def edit
    @result = Result.find(params[:id])
  end
  
  def update
    # byebug
    @result = Result.find(params[:id])
    @student = @result.student
    @result.student_id = @student.id

    if @result.update(studentinfo_params)
      redirect_to student_results_path(@student)
    else
      render :edit
    end
  end
  
  def destroy
    @student = Student.find(params[:student_id])
    @result = @student.Result.find(params[:id])
    @result.destroy
    redirect_to student_path
  end
  
  private 
  # def set_id
  #   @studentinfo.student_id = @student.id
  # end
  def studentinfo_params
    params.require(:result).permit(:subjects, :gread, :id)
  end
end
