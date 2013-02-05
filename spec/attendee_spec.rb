require_relative '../lib/attendee'

describe Attendee do
  before do
    @attendee = Attendee.new 'Fox','Chambers','123456789','20854'
  end

  it "has a name" do
    @attendee.name.should_not be_nil
  end

  it "has a phone number" do
    @attendee.phone_number.class.should == PhoneNumber
  end
  
  it "has a zipcode" do
    @attendee.zipcode.class.should == Zipcode
  end

end
