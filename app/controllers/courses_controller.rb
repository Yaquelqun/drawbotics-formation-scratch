class CoursesController < ApplicationController
before_action :authenticate_user!

def index
  @courses = Course.all
  if(params[:user_id].present?)
    @user = current_user
  end
end

def show
  @course = Course.find(params[:id])
  @chapters = @course.chapters
  @has_chapters = @chapters.any?
  unless(current_user == nil)
    @user = current_user
    @is_author = current_user.id == @course.author_id ? true : false
    last_eligible_chapter = @user.last_eligible_chapter(@course)
    if(last_eligible_chapter != nil)
      @eligible_chapters = last_eligible_chapter.higher_items
      @eligible_chapters.push last_eligible_chapter
      @eligible_chapters.push(last_eligible_chapter.lower_items.first)
    else
      @eligible_chapters = []
      @eligible_chapters.push(@course.chapters.first)
    end
  end
end

def new
  @course = Course.new
  @course.author_id = current_user.id
end

def create
  if current_user.type == "Teacher"
    @course = Course.create(course_params)
  else
    flash[:notice] = "you can't do that !!"
  end
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
  params.require(:course).permit(:name, :author_id)
end

end
