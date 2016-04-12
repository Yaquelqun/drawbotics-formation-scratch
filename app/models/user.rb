class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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

  def validated_chapters_for(course)
    pertinent_chapters = validated_chapters.delete_if{|chapter| chapter.course_id != course.id}
  end

  def last_eligible_chapter(course)
      sorted_chapter = validated_chapters_for(course)
      if(sorted_chapter.last != nil)
      validated_chapters_for(course).last
    else
      course.chapters.first
    end
  end

end
