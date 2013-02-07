require_relative 'phone_number'

describe PhoneNumber do

  context "with valid numbers" do

    before do
      @ten_digits = PhoneNumber.new '1234567890'
      @ten_digits_with_characters = PhoneNumber.new "(123) 456-7890"
      @eleven_digits = PhoneNumber.new "11234567890"
    end

    it "prints with the number" do
      @ten_digits.to_s.should == '1234567890'
    end

    it "removes characters that aren't digits" do
      @ten_digits_with_characters.to_s.should == '1234567890'
    end

    it "removes the first '1' in 11 digit numbers" do
      @eleven_digits.to_s.should == '1234567890'
    end

    it "validates a ten digit number" do
      @ten_digits.should be_valid
    end

    it "validates a ten digit number with characters" do
      @ten_digits_with_characters.should be_valid  
    end

    it "validates an eleven digit number that starts with 1" do
      @eleven_digits.should be_valid  
    end
  end

  context "with invalid numbers" do
    before do
      @short_number = PhoneNumber.new '1234'
      @eleven_digits = PhoneNumber.new '21234567890'
      @twelve_digits = PhoneNumber.new '321234567890'
    end

    it "invalidates a number that is too short" do
      @short_number.should_not be_valid
    end

    it "invalidates an 11 digit number that doesn't start with 1'" do
      @eleven_digits.should_not be_valid
    end

    it "invalidates a number that is 12 or more digits" do
      @twelve_digits.should_not be_valid
    end

    it "should print 'No Number'" do
      @short_number.to_s.should == "No Number"
    end

  end

end
