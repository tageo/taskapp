class Task < ActiveRecord::Base
  belongs_to :project

  validates :title,
  presence: {message:"入力してください"}


  scope :unfinished, -> {where(done:false)}

end
