class StudentinfoController < ApplicationController
  before_action :set_studentinfo, except[:new,:create,:show]
  def index
  end
  def show
    byebug
  	@studentinfo = Studentinfo.find(params[:id])
  end
  def new
    @studentinfo = Studentinfo.new
  end
  def create
    @studentinfo = Studentinfo.new(params[:id])

    if @studentinfo.save
      redirect_to @studentinfo
    else
      render :new
    end
  end

  def edit
    @studentinfo = Studentinfo.find(params[:id])
  end

  def update
    @studentinfo = Studentinfo.find(params[:id])

    if @studentinfo.update(studentinfo_params)
      redirect_to @studentinfo
    else
      render :edit
    end
  end

  def destroy
    @studentinfo = Studentinfo.find(params[:id])
    @studentinfo.destroy
    redirect_to root_path
  end

  private 
  def set_studentinfo
    # byebug
    @studentinfo.student_id = params(:student_id)
  end
  def studentinfo_params
  	params.require(:studentinfo).permit(:name, :address)
  end
end
