class AttendancesController < ApplicationController

def update
  success? ? attendance.success! : attendance.fail!
  redirect_to :back
end

def create
  if(params[:user_id] != nil)
    @attendance = Attendance.create(session_id: params[:id], user_id: params[:user_id], user_username: User.find(params[:user_id]).username) unless Attendance.exists?(session_id: params[:id], user_id: params[:user_id])
  else
    infos = params[:attendance][:user_username].split(":")
    @attendance = Attendance.create(session_id: params[:attendance][:session_id], user_id: infos.first, user_username: infos.last)
  end
  redirect_to user_path(current_user)
end

private
  def attendance
    @attendance ||= Attendance.find(params[:id])
  end

  def success?
    params[:success] == "true"
  end

  def attendance_params
    params.require(:attendance).permit(:session_id, :user_id, :user_username)
  end
end
