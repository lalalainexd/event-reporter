class PhoneNumber

  def initialize number
    @number = number 
    clean_number
  end

  #cleans a given number and returns the clean version. if the number is not valid, then number is set to nil
  def clean_number
    @number.gsub!(/\D/,"")

    if  has_11_digits? and starts_with_1?
      @number = @number[1..-1] 
    elsif invalid_length?
      @number = nil
    end

  end

  def starts_with_1?
    @number[0].to_i == 1
  end

  def has_11_digits?
    @number.length == 11
  end

  def invalid_length?
    @number.length != 10
  end

  def valid?
    !@number.nil?
  end

  def to_s
    @number.nil? ? "No Number" : @number
  end

  private :clean_number, :starts_with_1?, :has_11_digits?, :invalid_length?

end
