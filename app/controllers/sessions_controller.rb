class SessionsController < ApplicationController

  def show
    @session = Session.includes(attendances: [:user]).find(params[:id])
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
    @session.users << User.find(user_ids)
    redirect_to session_path(@session)
  end

  def destroy
    Session.find(params[:session_id]).delete

    redirect_to courses_path #TODO need a better redirect
  end

  def edit
    @session = Session.find(params[:id])
  end

  def update
    @session = Session.find(params[:id])
    if @session.update_attributes(session_params)
      redirect_to @session
    else
      fail!
    end
  end


  private

  def user_ids
    params.require(:session).permit(user_ids:[])[:user_ids].reject(&:empty?)
  end

  def session_params
    params.require(:session).permit(:location, :date, :position, :chapter_id, :duration)
  end

  def chapter
    @chapter ||= Chapter.find(params[:chapter_id])
  end
end
