class Job < ActiveRecord::Base
   has_many :job_emails, :dependent => :destroy
   validates_presence_of :name
   validates_presence_of :start_date

end
