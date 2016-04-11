class AttendancesController < ApplicationController

def update
  success? ? attendance.success! : attendance.fail!
  redirect_to :back
end

def create
  @attendance = Attendance.create(session_id: params[:id], user_id: params[:user_id])
  redirect_to User.find(params[:user_id])
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
