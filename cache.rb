class Cache
  attr_reader :records

  def initialize
    @records = []
  end
  
  def count
    @records.size
  end

  def add record
    @records << record
  end

  def sort_by sort_criteria
    @records = @records.sort_by{ |p| p.send(sort_criteria).downcase }
  end

  def clear
    @records.clear
  end

  def print_records *attribute

    print_header_row

    sort_by attribute[0] unless attribute.empty?

    @records.each  { |record| print_record record }

  end

  def print_record record
      puts record.values.inject(''){|print_string, h| "%s%-20s" % [print_string, h]}
  end

  def print_header_row
    last_name = "LAST NAME"
    first_name = "FIRST NAME"
    email = "EMAIL"
    zipcode = "ZIPCODE"
    city = "CITY"
    state = "STATE"
    address = "ADDRESS"
    phone = "PHONE"

    headers = [last_name, first_name, email, zipcode, city, state, address, phone]

    puts headers.inject(''){|sum, value| "%s%-20s" % [sum, value]}

  end

end

