class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def to_s
    email
  end
  def forem_admin? 
	if self.role == 'forem_admin'
	 true
	else
	 false
	end
  end
end
