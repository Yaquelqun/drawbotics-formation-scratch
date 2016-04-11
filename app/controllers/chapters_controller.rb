class ChaptersController < ApplicationController

def show
  @chapter = Chapter.find(params[:id])
  @sessions = @chapter.sessions
  if(params[:user_id].present?)
    @user = User.find(params[:user_id])
  end
end

def new
  @chapter = course.chapters.build
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
  @chapter = Chapter.create(chapter_params)
  redirect_to chapter_path(@chapter)
end

def destroy
  Chapter.find(params[:chapter_id]).delete
  redirect_to courses_path #TODO need a better redirect
end

private

def chapter_params
  params.require(:chapter).permit(:name, :position, :course_id)
end

def course
    @course ||= Course.find(params[:course_id])
end

end
