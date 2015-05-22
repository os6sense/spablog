class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable, #, :validatable, :recoverable
  devise :database_authenticatable, :rememberable, :trackable
end
