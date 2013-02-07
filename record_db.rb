require 'csv'
require_relative 'queue'

class RecordDB
  
  def initialize file
    @records = []

    load_db file
  end

  def load_db file
    contents = CSV.open file, headers: true, header_converters: :symbol

    contents.each{|entry| add_record entry}

  end

  def add_record entry
    record = Record.new(entry[:last_name], 
                         entry[:first_name],
                         entry[:email_address],
                         entry[:zipcode],  
                         entry[:city],
                         entry[:state],
                         entry[:street],
                         entry[:homephone])
    @records << record
  end

  def find attribute, criteria   
    @records.find_all do |record| 
      value = record.send(attribute)
      value.nil? ? false : value.downcase == criteria.downcase
    end

  end

  private :add_record, :load_db

end

Record = Struct.new(
  :last_name,
  :first_name,
  :email,
  :zipcode,
  :city,
  :state,
  :address,
  :phone)
