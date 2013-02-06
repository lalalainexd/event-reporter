require_relative "attendee"
require_relative "legislator_db"

class EventReporter
  def run

    loop do
      puts "Please enter a command: "
      parts = gets.chomp.split(' ')

      send("#{parts[0]}", parts[1..-1])



    end

  end

  def help args
    
    if args.size == 0
      print_command_list
    end
    
    puts "You asked for help"

  end

  def quit args
    exit
  end

  def print_command_list
    puts 'print command list'
  end


end



EventReporter.new.run

