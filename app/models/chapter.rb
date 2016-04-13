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

  def eligible_students
    previous_chapter = self.higher_item
    if previous_chapter == nil
      Student.all
    else
      previous_chapter.attendances.validated.map(&:user).reject{|user| user.is_teacher} #TODO the reject is basically useless since Teachers can't be added to the fist chapter :D
    end
  end
end
