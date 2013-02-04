require_relative '../lib/attendee'

describe Attendee do
  before do
    @attendee = Attendee.new 'Fox','Chambers','123456789','20854'
  end

  it "has a name" do
    @attendee.name.should_not be_nil
  end

  it "has a phone number" do
    @attendee.phone_number.should_not be_nil
  end
  
  it "has a zipcode" do
    @attendee.zipcode.should_not be_nil
  end
end
