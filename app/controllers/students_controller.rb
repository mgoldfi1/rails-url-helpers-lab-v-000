
class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
    if @student.active
      @status = "active"
    else
      @status = "inactive"
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
      @student.update(active: !@student.active)
      redirect_to student_path(@student)
      #
    end

    
end
