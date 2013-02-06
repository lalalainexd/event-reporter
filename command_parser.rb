class CommandParser
  
  def self.parse args
    parts = args.chomp.split
    case parts[0]
    when 'load' then
      parts.length == 1 ? load_file : load_file(parts[1])
    when 'help' then
      parts.length == 1 ? help : help(parts[1..-1])
    when 'find' then
      parts.length < 3 ? command_not_recognized : ( find parts[1], parts[2] )
    when 'queue' then
      parse_queue_commands parts[1..-1]
    else
      command_not_recognized
    end

  end

  def self.load_file *args
    args.empty? ? {:command => :load} : {:command => :load, :filename => args[0]}
  end

  def self.find attribute, criteria
    {:command => :find, :attribute => attribute.to_sym, :criteria => criteria}
  end

  def self.help *args
    args.empty? ? {:command => :help} : {:command => :help, :commands => args.flatten.collect{|arg| arg.to_sym}}
  end

  def self.command_not_recognized
    {:command => :command_not_recognized}
  end

  def self.parse_queue_commands args
    case args[0]
    when 'count' then
      {:command => :count}
    when 'clear' then
      {:command => :clear}
    when 'print' then
      if args.length == 1
        {:command => :print }
      elsif args[1] == 'by' and args.length > 2
        {:command => :print, :attribute => args[2].to_sym}
      else
        command_not_recognized
      end
    when 'save' then
      if args.length < 3 or args[1] != 'to'
        command_not_recognized
      else
        {:command => :save, :filename => args[2]}
      end
    else
      command_not_recognized
    end
  end
end
