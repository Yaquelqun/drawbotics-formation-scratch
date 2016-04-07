class AttendancesController < ApplicationController

def update
  success? ? attendance.success! : attendance.fail!
  redirect_to :back
end

private
  def attendance
    @attendance ||= Attendance.find(params[:id])
  end

  def success?
    params[:success] == "true"
  end
end
