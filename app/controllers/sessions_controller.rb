class SessionsController < ApplicationController

  def show
    @session = Session.find(params[:id])
  end
  def new
    @session = chapter.sessions.build
    if chapter.sessions.any?
      @session.position = chapter.sessions.count + 1
    else
      @session.position = 1
    end
  end

  def create
    @session = Session.create(session_params)
    redirect_to session_path(@session)
  end
  private

  def session_params
    params.require(:session).permit(:location, :date, :position, :chapter_id)
  end

  def chapter
    @chapter ||= Chapter.find(params[:chapter_id])
  end
end
