class CommandParser
  
  def self.parse args
    parts = args.chomp.split
    case parts[0]
    when 'load' then
      load_file :filename => parts[1]
    when 'help' then
     parts.length == 1 ? help : help( :commands => parts[1..-1] )
    when 'find' then
      parts.length < 3 ? command_not_recognized : ( find parts[1], parts[2] )
    when 'queue' then
      parse_queue_commands parts[1..-1]
    when 'quit' then
      {:command => :quit}
    else
      command_not_recognized
    end

  end

  def self.load_file options={}

    command = {:command => :load}
    command[:filename] = options[:filename] unless options[:filename].nil?

    command

  end

  def self.find attribute, criteria
    {:command => :find, :attribute => attribute.to_sym, :criteria => criteria}
  end

  def self.help options={}
    help_command = {:command => :help}
    help_command[:commands] = options[:commands].collect{|c| c.to_sym} unless options[:commands].nil?

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
