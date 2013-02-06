require_relative "record_db"
require_relative "queue"
require_relative "record"

class EventReporterController

  def initialize
    @queue = Queue.new
  end

  def load *file
    @db = RecordDB.new file[0]
  end

  def find attribute, criteria
    @db.find attribute, criteria
  end

  def count
    @queue.count
  end

  def clear
    @queue.clear
  end

  
  
end
