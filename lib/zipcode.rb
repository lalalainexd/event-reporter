class Zipcode
  
  def initialize number
    @number = clean number
  end

  def clean number
    number.to_s.rjust(5,"0")[0,5]
  end

  def to_s
    @number
  end

  private :clean
end
