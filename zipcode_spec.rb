require_relative '../lib/zipcode'

describe Zipcode do

  before do
    @five_digits = Zipcode.new '12345'
    @short_zipcode = Zipcode.new'123'
    @long_zipcode = Zipcode.new '123456'
  end

  it "prints with the number" do
    @five_digits.to_s.should == '12345'
  end
  
  it "adds 0 to the beginning of zipcodes less than 5 digits" do
    @short_zipcode.to_s.should == '00123'
  end

  it "keeps only the first 5 digits for numbers longer than 5 digits" do
    @long_zipcode.to_s.should == '12345'
  end





end
