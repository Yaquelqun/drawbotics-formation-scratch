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
end
