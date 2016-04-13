class Teacher < User

#relationships to other models
has_many :courses, :foreign_key => 'author_id'
has_many :sessions, :foreign_key => 'teacher_id'

def is_teacher
  true
end

end
