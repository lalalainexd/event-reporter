require_relative 'record_db'
require_relative 'cache'
require_relative 'command_parser'
require 'csv'

class EventReporterController

  def initialize
    @cache = Cache.new
  end

  def parse input
    CommandParser.parse input
  end

  def perform command, options={}
    options.empty? ? send( command  ): send( command, options )
  end

  def load options={}
    defaults = {:filename => "event_attendees.csv"}
    options = defaults.merge options
    
    @db = RecordDB.new options[:filename]
  end

  # Finds records in the DB, adds them to the cache and returns results of the query
  def find options ={}
    results = @db.find options[:attribute ], options[:criteria]
    results.each{|r| @cache.add r}

    results
  end

  def print  option ={}
    @cache.print_records option[:attribute]
  end

  def count
    @cache.count
  end

  def clear
    @cache.clear
  end

  #assuming filename already .csv as the extenstion
  def save filename
    @cache.records    
    csv_file = CSV.open filename, 'w' do |csv|

      csv << headers

      @cache.records.each{|record| csv << record.values}
      end
  end

  def quit
    exit
  end


  def headers
    last_name = "LAST NAME"
    first_name = "FIRST NAME"
    email = "EMAIL"
    zipcode = "ZIPCODE"
    city = "CITY"
    state = "STATE"
    address = "ADDRESS"
    phone = "PHONE"

    headers = [last_name, first_name, email, zipcode, city, state, address, phone]

  end
  
end
