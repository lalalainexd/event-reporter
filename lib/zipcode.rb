class Zipcode
  
  def initialize number
    @number = clean_number number
  end

  def clean_number number
    number.to_s.rjust(5,"0")[0,5]
  end

  def to_s
    @number
  end

  private :clean_number
end
