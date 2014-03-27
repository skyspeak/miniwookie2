class Job < ActiveRecord::Base
   has_many :job_emails, :dependent => :destroy
end
