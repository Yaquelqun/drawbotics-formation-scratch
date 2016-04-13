class Session < ActiveRecord::Base
  #relationships to other models
belongs_to :chapter
has_many :attendances
has_many :users, through: :attendances, dependent: :nullify
belongs_to :teacher, class_name: "User::Teacher"

#validation process
validates(:location, presence: true, allow_blank: false, length: {maximum: 60} )
validates(:date, presence: true, allow_blank: false, length: {maximum: 60} )
validates(:position, presence: true, allow_nil: false )
validates(:chapter_id, presence: true, allow_nil: false, )

delegate :course, to: :chapter

def student_number
  attendances.count
end

end
