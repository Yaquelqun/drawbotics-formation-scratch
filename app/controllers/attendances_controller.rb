class AttendancesController < ApplicationController

def update
  success? ? attendance.success! : attendance.fail!
  redirect_to :back
end

def create
  @attendance = Attendance.create(attendance_params)
  redirect_to :back
end
private
  def attendance
    @attendance ||= Attendance.find(params[:id])
  end

  def success?
    params[:success] == "true"
  end

  def attendance_params
    params.require(:attendance).permit(:session_id, :user_id)
  end
end
