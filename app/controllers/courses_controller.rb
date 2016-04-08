class CoursesController < ApplicationController

def index
  @courses = Course.all
end

def show
  @course = Course.find(params[:id])
  @chapters = @course.chapters
end

def new
  @course = Course.new
end

def create
  @course = Course.create(course_params)
  redirect_to courses_path
end

def edit
  @course = Course.find(params[:id])
end

def update
  @course = Course.find(params[:id])
  if @course.update_attributes(course_params)
    redirect_to @course
  else
    fail!
  end
end

def destroy
  Course.find(params[:course_id]).delete
  redirect_to courses_path
end

private

def course_params
  params.require(:course).permit(:name)
end

end
