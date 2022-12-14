class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students
  end

  def grades
    @students = Student.order(grade: :desc)
    render json: students
  end

  def highest_grade
    student = Student.order(grade: :desc).first
    render json: student
  end
  
  def show
  student = Student.find(params[:id])
  render json: student
  end

  def search
  first_name = params[:first_name]
  last_name = params[:last_name]
  @students = Student.where(first_name: first_name).or(Student.where(last_name: last_name))
    render json: @students
  end

end
