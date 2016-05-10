class Droplet < ActiveRecord::Base
  def on?
    self.status == 'active'
  end

  def off?
    self.status == 'off'
  end
end
