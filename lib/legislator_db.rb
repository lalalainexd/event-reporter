require "csv"
require "sunlight"

module LegislatorDb

  Sunlight::Base.api_key = "e179a6973728c4dd3fb1204283aaccb5"

  def self.legislators_in_zipcode zipcode
    Sunlight::Legislator.all_in_zipcode(zipcode)
  end
end
