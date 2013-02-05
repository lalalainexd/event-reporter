require_relative 'phone_number'
require_relative 'zipcode'

class Attendee
  attr_reader :name
  attr_reader :phone_number
  attr_reader :zipcode

  def initialize first_name, last_name, phone_number, zipcode
    @name = "#{first_name} #{last_name}"
    @phone_number = PhoneNumber.new phone_number 
    @zipcode = Zipcode.new zipcode
  end

end
