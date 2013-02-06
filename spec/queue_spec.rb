require_relative '../lib/queue'
require_relative '../lib/record'

describe Queue do

  before do
    @mock_record = Record.new "Smith", "John","john_smith@blah.com","80246","Denver","Colorado", "1111 Washington Stree","1234567890"

    @mock_record2 = Record.new "Thomas", "Emily","emily@blah.com","70246","Falls Church","Virginia", "31242 Washington Street","0987654321"
    
    @empty_queue = Queue.new
    @queue = Queue.new 
    @queue.add @mock_record

    @queue2 = Queue.new
    @queue2.add @mock_record
    @queue2.add @mock_record2
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

  it "prints ... visual test" do
    @queue2.print_records
  end

end

