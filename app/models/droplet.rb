class Droplet < ActiveRecord::Base
  has_many :actions
  
  def on?
    self.status == 'active'
  end

  def off?
    self.status == 'off'
  end
end
