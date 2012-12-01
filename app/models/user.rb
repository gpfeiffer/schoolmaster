class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :assignments
  has_many :roles, :through => :assignments

  def role? symbol
    roles.map(&:name).include? symbol.to_s.camelcase
  end

  def to_s
    email
  end
end