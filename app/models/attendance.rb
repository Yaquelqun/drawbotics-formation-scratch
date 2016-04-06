class Attendance < ActiveRecord::Base
  #relationships to other models
  belongs_to :user
  belongs_to :session

  #validation process
  validates(:user_id, presence: true, allow_nil:false)
  validates(:session_id, presence: true, allow_nil:false)
end
