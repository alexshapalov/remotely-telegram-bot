require 'active_record'

class Job < ActiveRecord::Base
  # connects_to database: { reading: :jobs_db }
end
