class ResultsController < ApplicationController
    def index
        @result = Result.find(params[:student_id])
        @result = Result.all
      end
  
      def show
        @student = Student.find(params[:student_id])
        @result = @student.result
      end
  
      def new
        @result = Result.new
      end
  
      def create
        @student = Student.find(params[:id])
        @result = @student.create_result(studentinfo_params)
        @result.save
        flash[:notice] = "success"
        redirect_to student_path(@result)
      end
    
      def edit
        @student = Student.find(params[:id])
        # @studentinfo = @student.studentinfo
        # @studentinfo = Student.find(params[:id])
      end
    
      def update
        @student = Student.find(params[:id])
        @result = @student.studentinfo
    
        if @result.update(studentinfo_params)
          redirect_to student_result_path
        else
          render :edit
        end
      end
    
      def destroy
        @result = Result.find(params[:student_id])
        @result.destroy
        redirect_to student_path
      end
    
      private 
      # def set_id
      #   @studentinfo.student_id = @student.id
      # end
      def studentinfo_params
          params.require(:result).permit(:sunjects, :gread, :id, :student_id)
      end
end
