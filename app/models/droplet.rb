class Droplet < ActiveRecord::Base
  def on?
    self.status == 'on'
  end

  def off?
    self.status == 'off'
  end
end
