require_relative 'event_reporter_controller'

describe EventReporterController do

  before do 
    @controller = EventReporterController.new
  end

  it "should exit cleanly when using 'quit'" do
    lambda { @controller.quit }.should raise_error(SystemExit)
  end
  
  context "loading files" do
    it "should load the default file when no file is specified" do
      RecordDB.should_receive(:new).with("event_attendees.csv")
      @controller.load  
    end

    it "should load the file specified in the options" do
      filename = 'some_file' 
      RecordDB.should_receive(:new).with(filename)
      @controller.load(:filename => filename) 
    end

  end

  context "finding files" do
    it "should add the results to the cache" do

    end
  end
end
