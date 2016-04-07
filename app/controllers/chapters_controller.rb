class ChaptersController < ApplicationController

def show
  @chapter = Chapter.find(params[:id])
  @sessions = @chapter.sessions
end

def new
  @chapter = course.chapters.build
  if course.chapters.any?
    @chapter.position = course.chapters.count + 1
  else
    @chapter.position = 1
  end
end

def create
  @chapter = Chapter.create(chapter_params)
  redirect_to chapter_path(@chapter)
end

private

def chapter_params
  params.require(:chapter).permit(:name, :position, :course_id)
end

def course
    @course ||= Course.find(params[:course_id])
end

end
