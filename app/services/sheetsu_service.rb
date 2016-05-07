require 'httparty'

class SheetsuService
  include HTTParty

  base_uri ENV['SHEETSU_URL']

  def initialize(base_uri: nil)
    self.class.base_uri(base_uri)
  end

  def get_all
    self.class.get("/")
  end
end
