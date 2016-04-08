class User < ActiveRecord::Base
  #relationships to other models
  has_many :attendances
  has_many :sessions, through: :attendances
  has_many :chapters, through: :sessions
  has_many :courses, through: :chapters

  #validation process
  validates(:username, presence:true, allow_blank:false, length: {maximum: 60})

end
