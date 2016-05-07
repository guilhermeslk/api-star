require 'httparty'

class SheetsuService
  include HTTParty
  
  def initialize(base_uri:)
    self.class.base_uri(base_uri)
  end

  def get_all
    self.class.get("/")
  end
end
