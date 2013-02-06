require_relative 'command_parser'

describe CommandParser do

  before do
    @parser = CommandParser.new
  end

  it "should recognize the command 'load'" do
    @parser.parse( 'load' ).should == {:command => :load }
  end

  it "should recognize the command 'load' and a filename" do
    @parser.parse('load somefile.csv').should == {:command => :load, :filename=>'somefile.csv'}
  end

  it "should recognize the command 'find' with attributes and critieria on those attributes" do
    @parser.parse('find zipcode 20123').should == {:command => :find, :attribute => :zipcode, :criteria => '20123'}
  end


  it "should recognize the command 'help'" do
    @parser.parse('help').should == {:command => :help}
  end

  it "should recognized the command 'help' with attributes for specific commands" do
    @parser.parse('help load').should == {:command => :help, :commands => [:load]}
  end

  context "commands about the queue" do

    it "should recognize 'queue count'" do
      @parser.parse('queue count').should == {:command => :count}
    end

    it "should recognize 'queue clear'" do
      @parser.parse('queue clear').should == {:command => :clear}
    end

    it "should recognize 'queue print'" do
      @parser.parse('queue print').should == {:command => :print}
    end

    it "should recognize 'queue print by' followed by an attribute" do
      @parser.parse('queue print by zipcode').should == {:command => :print, :attribute => :zipcode}
    end

    it "should recognize 'queue save to' followed by a filename" do
      @parser.parse('queue save to somefile.csv').should == {:command => :save, :filename =>'somefile.csv'}
    end
  end

  context 'bad commands' do
    it "should not recognize stuff that isn't a command" do
      @parser.parse('asdff').should == {:command => :command_not_recognized}
    end

    it "should return :command_not_recognized when parsing find with less than 2 other arguments" do
      @parser.parse('find something').should ==  {:command => :command_not_recognized}
    end

    it "should return :command_not_recognized when parsing queue with commands that don't exist" do
      @parser.parse('queue print blah').should ==  {:command => :command_not_recognized}
    end

    it "should return :command_not_recognized when parsing queue print by without attributes" do
      @parser.parse('queue print by').should ==  {:command => :command_not_recognized}
    end

  end
end
