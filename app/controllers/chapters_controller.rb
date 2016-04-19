class ChaptersController < ApplicationController
before_action :authenticate_user!
def show
  @chapter = Chapter.find(params[:id])
  @sessions = @chapter.sessions
  @course = Course.find(@chapter.course_id)
  @is_author = current_user.id == @course.author_id ? true : false
  @has_sessions = @sessions.any?
  if(params[:user_id].present?)
    @user = current_user
  end
end

def new
  if(params[:course_id])
    @chapter = course.chapters.build
  else
    redirect_to courses_path
  end
end

def edit
  @chapter = Chapter.find(params[:id])
end

def update
  @chapter = Chapter.find(params[:id])
  if @chapter.update_attributes (chapter_params)
    redirect_to @chapter
  else
    dail!
  end
end

def create
  if (Course.find(chapter_params[:course_id]).author_id == current_user.id && current_user.type != "Student")
  @chapter = Chapter.create(chapter_params)
  redirect_to chapter_path(@chapter)
  else
    flash[:notice] = "you're not authorized to do that"
    redirect_to courses_path
  end
end

def destroy
  Chapter.find(params[:chapter_id]).delete
  redirect_to course_path(course)
end

private

def chapter_params
  params.require(:chapter).permit(:name, :position, :course_id)
end

def course
    @course ||= Course.find(params[:course_id])
end

end
