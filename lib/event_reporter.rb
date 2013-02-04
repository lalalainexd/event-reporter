require "csv"
require "sunlight"
require "erb"
require "date"
Sunlight::Base.api_key = "e179a6973728c4dd3fb1204283aaccb5"

puts "EventManager initialized."

@contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol


def clean_zipcode(zipcode)
  zipcode = zipcode.to_s.rjust(5,"0")[0,5]
end

def legislators_in_zipcode(zipcode)
	Sunlight::Legislator.all_in_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
    Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number phone_number
  if is_valid_number? phone_number
    if phone_number.length > 10
      phone_number[1..-1]
    else
      return phone_number
    end
  else
    return nil
  end

end

def is_valid_number? phone_number
  #pull out digits only
  phone_number.gsub!(/\D/,"")

  #check length
  if phone_number.length < 10 || phone_number.length > 11
    false
  elsif phone_number.length == 11
    phone_number[0] == 1
  else
    true
  end
end

def get_hour date 
  DateTime.strptime(date, "%m/%d/%y %H:%M").hour
end 

def get_day_of_week date
  day = DateTime.strptime(date, "%m/%d/%y %H:%M").wday
return day
end

@template_letter = File.read "form_letter.erb"
@erb_template = ERB.new @template_letter

def create_letter name, legislators
	personal_letter = @template.gsub('FIRST_NAME', name)
	personal_letter.gsub('LEGISLATORS', legislators.join(","))
end

def create_form_letters
  @contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_in_zipcode(zipcode)

  number = clean_phone_number row[:homephone]

  form_letter = @erb_template.result(binding)

  save_thank_you_letters(id, form_letter)

  end
end

def get_peak_registration_hour
  @contents.rewind
  all_hours = @contents.collect {|row| get_hour row[:regdate] }
  

  frequency = all_hours.inject(Hash.new(0)) {|hours,hour| hours[hour] += 1; hours }
  frequency.sort_by{|hour| hour.last}.last.first
end

def get_peak_registration_day
  @contents.rewind
  all_days = @contents.collect { |row| get_day_of_week row[:regdate] }
  
  frequency = all_days.inject(Hash.new(0)) {|days,day| days[day] += 1; days }

  frequency.sort_by{|day| day.last}.last.first
end

#create_form_letters
puts "The peak registration hours is #{get_peak_registration_hour}"
puts "The peak registration day of the week is #{get_peak_registration_day}"


