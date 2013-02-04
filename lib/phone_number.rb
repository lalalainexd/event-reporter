class PhoneNumber

  def initialize number
    @number = clean_number number 
  end

  #cleans a given number and returns the clean version. if the number is not valid, then number is set to nil
  def clean_number number
    number.gsub!(/\D/,"")

    if has_10_digits? number
      return number
    elsif  has_11_digits? number and starts_with_1? number   
      return number[1..-1] 
    else
      return nil
    end

  end

  def starts_with_1? number
    number[0].to_i == 1
  end

  def has_11_digits? number
    number.length == 11
  end

  def has_10_digits? number
    number.length == 10
  end

  def valid?
    !@number.nil?
  end

  def to_s
    @number.nil? ? "No Number" : @number
  end

  private :clean_number, :starts_with_1?, :has_11_digits?, :has_10_digits?

end
