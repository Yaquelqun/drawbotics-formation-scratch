class Chapter < ActiveRecord::Base
  #relationships to other models
  belongs_to :course
  has_many :sessions
  has_many :attendances, through: :sessions
  has_many :users, through: :attendances

  #validation process
  validates(:name, presence: true, length: {maximum: 60})
  validates(:course_id, presence: true, allow_nil: false)

  acts_as_list scope: :course, add_new_at: :bottom

  scope :included_in, -> (id) { where(course_id: id) }

end
