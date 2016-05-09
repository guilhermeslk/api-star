class Droplet < ActiveRecord::Base
  has_many :schedules
end
