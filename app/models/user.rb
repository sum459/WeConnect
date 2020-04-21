class User < ApplicationRecord
 
 acts_as_voter
 has_many :posts
 acts_as_commontator
 
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:login]


validates_presence_of :first_name, :last_name, :user_name, :contact
  validates_uniqueness_of :user_name, :contact
  
  attr_writer :login

  def login
    @login || self.user_name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["user_name = :value Or email = :value", { :value => login }]).first
      elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end
end
