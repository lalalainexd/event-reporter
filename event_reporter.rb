require_relative 'event_reporter_controller'

class EventReporter

  def initialize
    @controller = EventReporterController.new

  end

  def run

    loop do

      puts "Please enter a command: "
      command = @controller.parse gets.chomp

      if command[:command] == :command_not_recognized
        print "Command not recognized. Type help for a list of available commands"
      else
        @controller.perform command[:command]
      end

    end

  end

end

EventReporter.new.run

