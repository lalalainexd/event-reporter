require_relative 'record_db'
require_relative 'cache'
require_relative 'command_parser'
require 'csv'

class EventReporterController

  def initialize
    @queue = Cache.new
  end

  def parse input
    CommandParser.parse input
  end

  def perform command, options={}
    send command options
  end

  def load options={}
    defaults = {:filename => "event_attendees.csv"}
    options = defaults.merge options
    
    puts options[:filename]

    @db = RecordDB.new options[:filename]
  end

  def find attribute, criteria
    results = @db.find attribute.chomp, criteria.chomp
    results.each{|r| @queue.add r}

    results
  end

  def sort_by attribute
    @queue.all attribute.chomp
  end

  def count
    @queue.count
  end

  def clear
    @queue.clear
  end

  #assuming filename already .csv as the extenstion
  def save filename
    @queue.records    
    csv_file = CSV.open filename, 'w' do |csv|

      csv << headers

      @queue.records.each{|record| csv << record.values}
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
