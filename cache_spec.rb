require_relative 'cache'
require_relative 'record_db'

describe Cache do

  before do
    @mock_record = Record.new "Smith", "John","john_smith@blah.com","80246","Denver","Colorado", "1111 Washington Rd","1234567890"

    @mock_record2 = Record.new "Thomas", "Emily","emily@blah.com","70246","Falls Church","Virginia", "31242 Washington Street","0987654321"

    @mock_record3 = Record.new "George", "Richard","gumby@blah.com","20954","Potomac Church","MD", "41234 Hikcory Lane","3214567890"
    
    @empty_queue = Cache.new

    @queue = Cache.new 
    @queue.add @mock_record

    @queue2 = Cache.new
    @queue2.add @mock_record
    @queue2.add @mock_record2
    @queue2.add @mock_record3
  end

  it "returns a count of 0 in a queue with zero records" do
    @empty_queue.count.should == 0    
  end

  it "returns a count of 1 in a queue with 1 recrod" do
    @queue.count.should == 1
  end

  it "removes all records when clear is called" do
    @queue.clear.count.should == 0
  end

  it "can sort records based on an attribute" do
    records = @queue2.sort_by(:first_name)
    records[0].should == @mock_record2
    records[1].should == @mock_record
    records[2].should == @mock_record3
  end

  it "prints ... visual test" do
    @queue2.print_records
  end

  it "prints ... visual test" do
    @queue2.print_records :first_name
  end

end

