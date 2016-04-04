class User < ActiveRecord::Base
  attr_accessor :remember_token
  attr_accessor :password, :password_confirmation
  has_many :events, dependent: :destroy
  before_save   :downcase_email
  validates :name, presence: true, length: {minimum: 2}
  validates :email, presence: true, length: {minimum:10}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
 
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)  
  end
  
  def feed
    if !self.admin?
      event_ids = "SELECT * FROM events
                     WHERE  user_id = :user_id"
      Event.where("user_id = :user_id", user_id: id)
    else
      event_ids = "SELECT * FROM events
                     WHERE  course = :user_id.course"
      Event.where("user_id = :user_id AND course = :course_id", user_id: id, course_id: id.course)
     end
  end
  private
  def downcase_email
    self.email = email.downcase
  end

end
