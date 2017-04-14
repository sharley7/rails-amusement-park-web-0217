class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  #validates :name, :password, :happiness, :nausea, :height, :tickets, presence: true


  has_secure_password

  def mood
    if self.nausea > self.happiness
      return 'sad'
    else
      return 'happy'
    end
  end


end
