require_relative 'event_reporter_controller'
require_relative 'record_db'
require_relative 'cache'

describe EventReporterController do

  before do 
    @controller = EventReporterController.new
  end

  it "should exit cleanly when using 'quit'" do
    lambda { @controller.perform :quit}.should raise_error(SystemExit)
  end
  
  context "loading files" do
    it "should load the default file when no file is specified" do
      RecordDB.should_receive(:new).with("event_attendees.csv")
      @controller.perform :load  
    end

    it "should load the file specified in the options" do
      filename = 'some_file' 
      RecordDB.should_receive(:new).with(filename)
      @controller.perform :load, :filename => filename 
    end

  end

  context "finding records" do

    before do
      @attribute = "attribute"
      @criteria = "criteria"

      @mock_record = Record.new 1,2,3,4,5,6,7,8
      @mock_record2 = Record.new 8,7,6,5,4,3,2,1
      @mock_records = [@mock_record, @mock_record2]

      RecordDB.any_instance.stub(:find).with(@attribute,@criteria).and_return(@mock_records)

      @controller.perform :load

    end

    it "should return the records that match the attribute and criteria" do
      @controller.perform(:find, :attribute => @attribute,:criteria=>@criteria).should == @mock_records
    end

    it "should add the results to the cache" do
      Cache.any_instance.should_receive(:add).exactly(2).times
      @controller.perform :find, :attribute => @attribute,:criteria=>@criteria
    end

    it "should print all the records in the cache" do
      Cache.any_instance.should_receive(:print_records).exactly(1).times
      @controller.perform :print
    end
  end

end
