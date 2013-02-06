class Queue

  def initialize
    @records = []
  end
  
  def count
    @records.size
  end

  def add record
    @records << record
  end

  def all sort_criteria
    @records.sort_by{ |p| p.send(sort_criteria).downcase }
  end

  def clear
    @records.clear
  end

  def print_records *attribute
    @records.each  { |record| print_record record }

  end

  def print_record record
      row_data = [record.last_name, 
            record.first_name, 
            record.email, 
            record.zipcode, 
            record.city, 
            record.state, 
            record.address, 
            record.phone]

      puts row_data.inject(''){|sum, h| "%s%-20s" % [sum, h]}
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
