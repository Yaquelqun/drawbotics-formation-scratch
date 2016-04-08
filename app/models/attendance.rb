class Attendance < ActiveRecord::Base
  #relationships to other models
  belongs_to :user
  belongs_to :session

  #validation process
  validates(:user_id, presence: true, allow_nil:false)
  validates(:session_id, presence: true, allow_nil:false)

  scope :validated, -> { where(success: true)}

  def success!
    update!(success: true)
  end

  def fail!
    update!(success: false)
  end

  def success?
    success
  end

  def failed?
    !success
  end
end
