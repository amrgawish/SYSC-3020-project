class Event < ActiveRecord::Base
  #belongs_to :user
  validates :name, presence: true, length: {minimum: 4}
  validates :course, presence: true, length: {minimum: 7}
  validates :start_time, presence:true
  validates :end_time, presence:true
  
end
