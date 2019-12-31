class User < ActiveRecord::Base
  has_many :ideas
  has_many :likes
  has_many :liked_things, through: :likes, source: :idea
  has_secure_password
  validates :password, length: { minimum: 8 }
  validates :name, :username, :email, presence: true
  validates :email, uniqueness: true, on: :create
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :multiline => true,  on: :create
  before_save {|user| user.email = user.email.downcase} 
end
