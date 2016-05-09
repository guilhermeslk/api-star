require 'clockwork'
require "./config/boot"
require "./config/environment"

module Clockwork
  every(1.minute, "schedule.job") do
    puts "Schedule job"
  end
end
