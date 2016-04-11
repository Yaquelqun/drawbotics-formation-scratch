class User < ActiveRecord::Base
  #relationships to other models
  has_many :attendances
  has_many :sessions, through: :attendances
  has_many :chapters, through: :sessions
  has_many :courses, through: :chapters

  #validation process
  validates(:username, presence:true, allow_blank:false, length: {maximum: 60})

  def validated_chapters
    validated_attendances = attendances.validated
    validated_sessions = validated_attendances.map(&:session)
    validated_sessions.map(&:chapter).uniq
  end

  def current_chapter(course)
      validated_list = validated_chapters
      pertinent_chapters = validated_list.delete_if{|chapter| chapter.course_id != course.id}
      sorted_chapter = pertinent_chapters.sort_by{|chapter| chapter.position}
      if(sorted_chapter.last != nil)
      sorted_chapter.last.position
    else
      return 1
    end
  end

end
