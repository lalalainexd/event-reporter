require_relative 'event_reporter_controller'

controller = EventReporterController.new
controller.load
puts "#{ controller.find "first_name", "allison" }"
puts "#{ controller.find "last_name", "thomaS" }"

puts "#{ controller.count}"
puts "SAVING!!!!!!!!!!!!!!"
controller.save "output.csv"


