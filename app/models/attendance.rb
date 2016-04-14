class Attendance < ActiveRecord::Base
  #relationships to other models
  belongs_to :user
  belongs_to :session

  #validation process
  validates(:user_id, presence: true, allow_nil:false)
  validates(:session_id, presence: true, allow_nil:false)

  # after_create :save_user
  # after_validation :save_user
  # after_update :save_user

  delegate :chapter, to: :session
  delegate :course, to: :chapter, prefix: true

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

  private

  def save_user
    self.user_username = User.find(user_id).username unless User.find(user_id).username == nil
  end


end
