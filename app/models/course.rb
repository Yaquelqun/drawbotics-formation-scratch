class Course < ActiveRecord::Base
  #relationships to other models
  has_many :chapters, dependent: :nullify
  has_many :sessions , through: :chapters
  has_many :attendances, through: :sessions
  has_many :users, through: :attendances

  #validation process
  validates :name, presence: true, length: {maximum: 60}, allow_blank: false
end
