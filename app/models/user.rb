class User < ActiveRecord::Base
	has_many :items, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


        

         def days_left
         	7 - (DateTime.now.to_date - created_at.to_date).to_i
         end
end
