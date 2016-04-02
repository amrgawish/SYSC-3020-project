class User < ActiveRecord::Base
  has_many :events, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2}
  validates :email, presence: true, length: {minimum:10}
end
