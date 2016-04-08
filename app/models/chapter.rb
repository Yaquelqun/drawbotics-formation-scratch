class Chapter < ActiveRecord::Base
  #relationships to other models
  belongs_to :course
  has_many :sessions
  has_many :attendances, through: :sessions
  has_many :users, through: :attendances

  #validation process
  validates(:name, presence: true, length: {maximum: 60})
  validates(:position, presence: true)
  validates(:course_id, presence: true, allow_nil: false)

  scope :included_in, -> (id) { where(course_id: id) }


  # def getEligibleFor
  #   @eligibles = []
  #     self.sessions.each do |session|
  #       p session.location
  #     session.attendances.each do |attendance|
  #       p User.find(attendance.user_id).username
  #       p attedance.success
  #       if(attendance.success == "true")
  #         @eligibles.push(User.find(attendance.user_id))
  #       end
  #     end
  #   end
  #   return @eligibles
  # end

end
