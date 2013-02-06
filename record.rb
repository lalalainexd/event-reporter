class Record
  attr_accessor :last_name, :first_name, :email, :zipcode, :city, :state, :address, :phone

  def initialize last_name, first_name, email, zipcode, city, state, address, phone
    @last_name = last_name
    @first_name = first_name
    @email = email
    @zipcode = zipcode
    @city = city
    @state = state
    @address = address
    @phone = phone
  end

end
